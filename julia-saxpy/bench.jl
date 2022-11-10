print("Loading modules...");
flush(stdout);
using CUDA
using CUDA.CUBLAS
using DataFrames
using CSV
using Printf
println("done!");
flush(stdout);

# kernel definition
function saxpy_gpu_kernel!(z, a, x, y)
    i = (blockIdx().x - 1) * blockDim().x + threadIdx().x
    if i <= length(z)
        @inbounds z[i] = a * x[i] + y[i]
    end
    return nothing
end

# calling the kernel
function saxpy_kernel!(n, z, a, x, y; nthreads, nblocks)
    @cuda(threads = nthreads, blocks = nblocks, saxpy_gpu_kernel!(z, a, x, y))
    return nothing
end

# high-level broadcasting version
function saxpy_broadcasting!(n, z, a, x, y; nthreads, nblocks)
    z .= a .* x .+ y
    return z
end

function saxpy_cublas!(n, z, a, x, y; nthreads, nblocks)
    CUBLAS.axpy!(n, a, x, y)
    return nothing
end

function run_benchmarks(saxpy!)
    # for storing the results
    df = DataFrame(; n=Int[], var"GFLOP/s"=Float64[], var"GB/s"=Float64[], kind=String[])
    fname = string(saxpy!)
    # query how many threads per block are available on the GPU
    nthreads = CUDA.attribute(device(), CUDA.DEVICE_ATTRIBUTE_MAX_THREADS_PER_BLOCK)

    for i in 8:128
        # vector length:
        # always a multiple of nthreads per block (1024)
        # such that blocks are fully busy (no remainder).
        n = 1024 * 1024 * i
        # arbitrary constant
        a = 3.1415f0
        # allocate GPU memory
        x, y, z = CUDA.ones(n), CUDA.ones(n), CUDA.zeros(n)
        # compute how many blocks we need to use for the given `dim`
        nblocks = cld(n, nthreads)
        # benchmark: minimum time of 10 trials
        t_saxpy = 1e6
        for j in 1:10
            t = CUDA.@elapsed saxpy!(n, z, a, x, y; nthreads, nblocks)
            t_saxpy = min(t_saxpy, t)
        end
        # print and save results
        flops = 2.0 * n * (1000)^(-3) / t_saxpy
        bandwidth = 3.0 * sizeof(Float32) * n * (1000)^(-3) / t_saxpy
        @printf(
            "%s (julia): n= %12d %7.3f GFLOP/s %7.3f GB/s \n",
            fname,
            n,
            flops,
            bandwidth,
        )
        # force immediate printing to .out logfile
        flush(stdout)
        push!(df, (n, flops, bandwidth, fname))
        # explicitly free memory (to be safe)
        x, y, z = nothing, nothing, nothing
        GC.gc(true)
    end
    return df
end

println("Running measurements (kernel)...");
flush(stdout);
df_kernel = run_benchmarks(saxpy_kernel!)
df_broadcasting = run_benchmarks(saxpy_broadcasting!)
df_cublas = run_benchmarks(saxpy_cublas!)
df = vcat(df_kernel, df_broadcasting, df_cublas)

println("done!")
print("Writing results to disk...")
CSV.write("bench_results.csv", df)
println("done!")
