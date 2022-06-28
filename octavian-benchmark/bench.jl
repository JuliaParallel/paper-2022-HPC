#!/usr/bin/env sh
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 05:00:00
#SBATCH -A pc2-mitarbeiter
#SBATCH --exclusive
#SBATCH -o %x-%j.out
#=
ml r
ml lang/JuliaHPC/1.7.2-fosscuda-2020b-linux-x86_64
time srun julia --project=. -t 40 $(scontrol show job $SLURM_JOBID | awk -F= '/Command=/{print $2}')
exit
# =#

# load packages
@time begin
    using BLASBenchmarksCPU
    using JLD2
    using StatsPlots
    using InteractiveUtils
end

# system info
versioninfo()
flush(stdout)
host = gethostname()
nthreads = Threads.nthreads()
fname = "results_$(host)_$(nthreads)"
@show host
@show nthreads
@show fname
flush(stdout)

# run benchmark
rb = runbench(sizes=logspace(10, 1_000, 200));
flush(stdout)

# save/load results as JLD2
save("$fname.jld2", "rb", rb)
# rb = load("$fname.jld2", "rb")

# get dataframe with minimum times / maximum GFLOPS
df = BLASBenchmarksCPU.benchmark_result_df(rb, :minimum)
display(df)
flush(stdout)

# plotting
default(
    fontfamily="Computer Modern",
    linewidth=3,
    # markershape=:circle,
    # markersize=4,
    framestyle=:box,
    fillalpha=0.4,
    # size=(2000, 600)
)
scalefontsizes();
scalefontsizes(1.4);

@df df StatsPlots.plot(:Size, :GFLOPS; group=:Library, xlabel="Size", ylabel="GFLOPS", marker=false) # legend = :outerright
savefig("$fname.png")
savefig("$fname.svg")
