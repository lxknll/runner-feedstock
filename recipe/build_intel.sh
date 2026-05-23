#!/bin/bash
set -euxo pipefail

# Intel MKL threading and interface layer.  LP64 uses 32-bit integers
# (compatible with standard Fortran INTEGER), INTEL threading delegates
# OpenMP work to Intel's own runtime (iomp5).
export MKL_INTERFACE_LAYER=LP64
export MKL_THREADING_LAYER=INTEL

compile() {
    local EXE=$1 LIB=$2 FC=$3 USE_MPI=$4
    local BUILD_DIR="build_${EXE}"
    rm -rf "${BUILD_DIR}"

    cmake -S . -B "${BUILD_DIR}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DCMAKE_Fortran_COMPILER="${FC}" \
        -DUSE_MPI="${USE_MPI}" \
        -DUSE_MKL=ON \
        -DMKL_DIR="${PREFIX}" \
        -DENABLE_TESTS=OFF \
        -DENABLE_PREFACTORS=OFF \
        -DFC_NO_INNER_CUTOFF=OFF \
        -DCOMPATIBILITY_MODE_RUNNER1=OFF \
        -DBUILD_SHARED_LIB=ON

    cmake --build "${BUILD_DIR}" -j"${CPU_COUNT}"

    cp "${BUILD_DIR}/${EXE}" "${PREFIX}/bin/"
    cp "${BUILD_DIR}/${LIB}" "${PREFIX}/lib/"
    chmod +x "${PREFIX}/bin/${EXE}"
}

mkdir -p "${PREFIX}/bin" "${PREFIX}/lib"

# Serial build: ifx, no MPI
compile "RuNNer.x" "libRuNNer.so" "ifx" OFF

# MPI build: only for the intel_mpi variant; uses the Intel MPI mpiifx wrapper
if [[ "${runner_variant:-intel}" == "intel_mpi" ]]; then
    compile "RuNNer_mpi.x" "libRuNNer_mpi.so" "mpiifx" ON
fi
