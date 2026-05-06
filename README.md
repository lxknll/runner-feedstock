About runner-feedstock
======================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/runner-feedstock/blob/main/LICENSE.txt)

Home: https://www.theochem2.ruhr-uni-bochum.de/tc/software/runner.html.en

Package license: GPL-3.0-or-later

Summary: RuNNer - a Neural Network code for high-dimensional systems

Development: https://gitlab.com/runner-suite/runner2

Documentation: https://runner-suite.gitlab.io/runner2

RuNNer is a software framework for the development of Behler-Parrinello
high-dimensional neural network potentials (HDNNPs), actively developed
at Ruhr Universität Bochum, Germany.


Available packages
==================

This feedstock produces two mutually exclusive packages.  Install **one**
of them — they cannot coexist in the same conda environment because they
provide the same binary paths.

### `runner` — GCC / OpenBLAS (recommended for most users)

Compiled with GCC/gfortran and linked against OpenBLAS via the
conda-forge `libblas` abstraction layer.

| Executable | Description |
|---|---|
| `RuNNer.x` | Serial (single-process) build |
| `RuNNer_mpi.x` | MPI-parallel build (mpich or openmpi variant) |

Available on Linux x86-64 and macOS (x86-64, arm64).

### `runner-intel` — Intel ifx / MKL (maximum performance on Intel CPUs)

Compiled with Intel's LLVM-based Fortran compiler (`ifx`) and linked
against Intel MKL for optimal performance on Intel processors.

| Executable | Description |
|---|---|
| `RuNNer.x` | Serial (single-process) build |

Available on Linux x86-64 only.

> **Note — no MPI support in runner-intel**
> The MPI-parallel build (`RuNNer_mpi.x`) is not yet available in the
> `runner-intel` variant.  The Intel Fortran + MPI toolchain integration
> is still under development.  If you need MPI-parallel execution, use
> the `runner` package instead.


Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=12016&branchName=main">
            <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/runner-feedstock?branchName=main">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>linux_64_mpimpich (runner + runner-intel)</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=12016&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/runner-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_mpimpich" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_mpiopenmpi (runner only)</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=12016&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/runner-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_mpiopenmpi" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_mpimpich (runner only)</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=12016&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/runner-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_mpimpich" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_mpiopenmpi (runner only)</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=12016&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/runner-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_mpiopenmpi" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-runner-green.svg)](https://anaconda.org/conda-forge/runner) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/runner.svg)](https://anaconda.org/conda-forge/runner) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/runner.svg)](https://anaconda.org/conda-forge/runner) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/runner.svg)](https://anaconda.org/conda-forge/runner) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-runner--intel-green.svg)](https://anaconda.org/conda-forge/runner-intel) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/runner-intel.svg)](https://anaconda.org/conda-forge/runner-intel) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/runner-intel.svg)](https://anaconda.org/conda-forge/runner-intel) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/runner-intel.svg)](https://anaconda.org/conda-forge/runner-intel) |

Installing runner
=================

Add the `conda-forge` channel and install your preferred variant:

```
conda config --add channels conda-forge
conda config --set channel_priority strict
```

GCC / OpenBLAS variant (recommended):

```
conda install runner
```

Intel ifx / MKL variant (Linux only, serial only):

```
conda install runner-intel
```

Or with `mamba`:

```
mamba install runner          # GCC + OpenBLAS
mamba install runner-intel    # Intel ifx + MKL
```

To list all available builds on your platform:

```
conda search runner --channel conda-forge
conda search runner-intel --channel conda-forge
```


Automatic version updates
=========================

The conda-forge autotick bot (regro-cf-autotick-bot) monitors the
upstream GitLab repository for new release tags.  When a new version of
RuNNer is tagged, the bot automatically opens a pull request to this
feedstock with the updated version string and source archive checksum.
Once CI passes and the PR is merged, the new packages are built and
uploaded to the `conda-forge` channel without any manual intervention.


About conda-forge
=================

[![Powered by
NumFOCUS](https://img.shields.io/badge/powered%20by-NumFOCUS-orange.svg?style=flat&colorA=E1523D&colorB=007D8A)](https://numfocus.org)

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[Azure](https://azure.microsoft.com/en-us/services/devops/), [GitHub](https://github.com/),
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/),
[Drone](https://cloud.drone.io/welcome), and [TravisCI](https://travis-ci.com/)
it is possible to build and upload installable packages to the
[conda-forge](https://anaconda.org/conda-forge) [anaconda.org](https://anaconda.org/)
channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance,
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information, please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating runner-feedstock
=========================

If you would like to improve the runner recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/runner-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks, and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@M0M097](https://github.com/M0M097/)
* [@Theochem2RUB](https://github.com/Theochem2RUB/)
* [@gunnar1987](https://github.com/gunnar1987/)
* [@jan-janssen](https://github.com/jan-janssen/)
* [@lxknll](https://github.com/lxknll/)
