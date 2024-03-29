# Bridging HPC Communities through the Julia Programming Language

[![License: MIT](https://img.shields.io/badge/License-MIT-success.svg)](https://opensource.org/licenses/MIT)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7236016.svg)](https://doi.org/10.5281/zenodo.7236016)
[![arXiv:2211.02740](https://img.shields.io/badge/PDF-arXiv:2211.02740-yellow)](https://arxiv.org/pdf/2211.02740)

This repository contains information and code to reproduce the results presented in [the
article](https://arxiv.org/abs/2211.02740)
```bibtex
@online{churavy2022bridging,
  title={Bridging {HPC} Communities through the {J}ulia Programming Language},
  author={Churavy, Valentin and Godoy, William F and Bauer, Carsten and
          Ranocha, Hendrik and Schlottke-Lakemper, Michael and R{\"a}ss, Ludovic
          and Blaschke, Johannes and Giordano, Mos{\'e} and
          Schnetter, Erik and Omlin, Samuel and Vetter, Jeffrey S and
          Edelman, Alan},
  year={2022},
  eprint={2211.02740},
  eprinttype={arxiv},
  eprintclass={cs.DC},
  doi={10.48550/arXiv.2211.02740}
}
```

If you find these results useful, please cite [the article](https://arxiv.org/abs/2211.02740) mentioned above. If you
use the implementations provided here, please **also** cite this repository as
```bibtex
@misc{churavy2022bridgingRepro,
  title={Reproducibility repository for
         "{B}ridging {HPC} Communities through the {J}ulia Programming Language"},
  author={Churavy, Valentin and Godoy, William F and Bauer, Carsten and
          Ranocha, Hendrik and Schlottke-Lakemper, Michael and R{\"a}ss, Ludovic
          and Blaschke, Johannes and Giordano, Mos{\'e} and
          Schnetter, Erik and Omlin, Samuel and Vetter, Jeffrey S and
          Edelman, Alan},
  year={2022},
  howpublished={\url{https://github.com/JuliaParallel/paper-2022-HPC}},
  doi={10.5281/zenodo.7236017}
}
```


## Abstract

The Julia programming language has evolved into a modern alternative to fill existing gaps in the requirements of
scientific computing and data science applications. Julia comes with a unified and coordinated single-language and
ecosystem paradigm, and has a proven track record at achieving high-performance without sacrificing user productivity.
This makes it a viable alternative to the existing increasingly costly many-body workflow composition strategy in
high-performance computing (HPC), i.e., using traditional HPC languages (Fortran, C, C++) for simulations and
higher-level languages (Python, R, Matlab) suitable for data analysis. Julia’s rapid growth in language capabilities,
package ecosystem, and community make it a promising new universal language for HPC. This paper presents the
views of a multidisciplinary group of researchers in academia, government, and industry advocating for an HPC software
development paradigm that emphasizes developer productivity, workflow portability, and low barriers for entry. We believe
that the Julia programming language, its ecosystem, and its community, provide modern and powerful capabilities which
enable this groups objectives. Crucially, we believe that Julia can provide a more feasible and less costly approach to
program scientific applications and workflows targeting HPC facilities. We examine the current practice and role of
Julia as a common end-to-end programming model to address major challenges in scientific reproducibility, data-driven
artificial intelligence/machine learning (AI/ML), co-design and workflows, scalability and performance portability in
heterogeneous computing, network, data management, and community education. As a result, we consider necessary
the diversification of current investments to fulfill the needs of the upcoming decade as more supercomputing centers
prepare for the Exascale era.

## Numerical experiments

To reproduce the numerical experiments, you need to install [Julia](https://julialang.org/).
The subfolders of this repository contain `README.md` files with instructions
to reproduce the numerical experiments, including postprocessing.


## Authors
* [Valentin Churavy](https://github.com/vchuravy), Massachusetts Institute of Technology (MIT), US
* [William F Godoy](https://www.ornl.gov/staff-profile/william-f-godoy), Oak Ridge National Laboratory (ORNL), US
* [Carsten Bauer](http://carstenbauer.eu/), Paderborn Center for Parallel Computing (PC2), Germany
* [Hendrik Ranocha](https://ranocha.de), University of Hamburg, Germany
* [Michael Schlottke-Lakemper](https://lakemper.eu), RWTH Aachen University, Germany
* [Ludovic Räss](https://github.com/luraess), ETH Zürich, Switzerland
* [Johannes Blaschke](https://www.nersc.gov/about/nersc-staff/data-science-engagement-group/johannes-blaschke/), National Energy Research Scientific Computing Center (NERSC), US
* [Mosé Giordano](https://giordano.github.io), University College London (UCL), UK
* [Erik Schnetter](https://perimeterinstitute.ca/people/erik-schnetter), Perimeter Institute, Canada
* [Samuel Omlin](https://github.com/omlins), Swiss National Supercomputing Centre (CSCS), Switzerland
* [Jeffrey S Vetter](https://www.ornl.gov/staff-profile/jeffrey-s-vetter), ORNL, US
* [Alan Edelman](https://math.mit.edu/~edelman/), MIT, US


## Disclaimer

Everything is provided as is and without warranty. Use at your own risk!
