using DataFrames
using DataFramesMeta
using CSV
using AlgebraOfGraphics
using CairoMakie
using Colors
set_aog_theme!()
# set_theme!(theme_ggplot2())

ibm_blue = colorant"#648fff"
ibm_purple = colorant"#785ef0"
ibm_pink = colorant"#dc267f"
ibm_orange = colorant"#fe6100"
ibm_yellow = colorant"#ffb000"

# Load Julia benchmark results
df = DataFrame(CSV.File("../bench_results.csv"))

# df_filtered = df
df_filtered = @chain df begin
    # @subset .!(startswith.(:kind, "saxpy_broadcasting"))
    @eachrow begin
        if :kind == "saxpy_cublas!"
            :kind = "CUBLAS.axpy!"
        end
    end
end

# plot everything
bandwidth_data = data(df_filtered) * mapping(
    :n,
    :var"GB/s",
    color=:kind,
)
# bandwidth_data = data(df) * mapping(:n, :var"GB/s", color = :kind => sorter("cublas", "saxpy_broadcasting!", "saxpy_kernel!"))
horizontal_line = data((x=[1e7, 1e8], y=[1550, 1550])) * mapping(:x, :y) * visual(Lines; linestyle=:dash)
fig = draw(
    bandwidth_data * (visual(Lines) + visual(Scatter)) + horizontal_line;
    axis=(
        aspect=1.95,
        xlabel="Vector length",
        ylabel="Bandwidth (GB/s)",
        # title="SAXPY Benchmark (NVIDIA V100-SXM2)",
        title="SAXPY Benchmark (NVIDIA A100-SXM4-40GB)",
        limits=(1e7, 1e8, 0, 1700),
        xticks=1e7:1e7:1e8,
        yticks=0:200:1600,
        topspinevisible=true,
        topspinecolor=:darkgray,
        rightspinevisible=true,
        rightspinecolor=:darkgray,
    ),
    palettes=(
        color=[
            # "saxpy_cublas!" => ibm_pink,
            "CUBLAS.axpy!" => ibm_pink,
            "saxpy_broadcasting!" => ibm_purple,
            "saxpy_kernel!" => ibm_blue,
        ],
    ),
    figure=(
        resolution=(800, 450),
        # figure_padding = (5.0, 5.0, 5.0, 5.0),
    ),
)

save("saxpy_julia.png", fig; px_per_unit=3)
save("saxpy_julia.pdf", fig;)
