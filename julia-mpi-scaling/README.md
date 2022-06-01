# Parallel efficiency on a weak scaling benchmark

This folder contains raw data of a weak scaling benchmark from 1 to 1024
Nvidia P100 GPUs on the Cray XC 50 Piz Daint at CSCS. The raw data are
contained in the plotting script `julia_c_scale_daint.jl`. To reproduce
the figure, execute
```bash
julia julia_c_scale_daint.jl
```

The script was created for Julia v1.7.2.
