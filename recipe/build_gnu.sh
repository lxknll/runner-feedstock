#!/bin/bash
set -euxo pipefail

# Shared library extension differs between Linux (.so) and macOS (.dylib).
if [[ "$(uname)" == "Darwin" ]]; then
    LIB_EXT="dylib"
else
    LIB_EXT="so"
fi

compile() {
    local EXE=$1 LIB=$2 FC=$3 USE_MPI=$4
    local BUILD_DIR="build_${EXE}"
    rm -rf "${BUILD_DIR}"

    cmake -S . -B "${BUILD_DIR}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
        -DCMAKE_Fortran_COMPILER="${FC}" \
        -DUSE_MPI="${USE_MPI}" \
        -DUSE_MKL=OFF \
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

if [[ "${with_mpi}" = "true" ]]; then
    compile "RuNNer_mpi.x" "libRuNNer_mpi.${LIB_EXT}" "mpif90" ON
else
    compile "RuNNer.x" "libRuNNer.${LIB_EXT}" "gfortran" OFF
fi
