#!/bin/bash
set -euxo pipefail

if [[ "${runner_variant:-gnu}" == intel* ]]; then
    bash "${RECIPE_DIR}/build_intel.sh"
else
    bash "${RECIPE_DIR}/build_gnu.sh"
fi
