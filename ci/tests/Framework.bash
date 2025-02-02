#!/bin/bash
####
# Framework.bash:
#
# Run the tests on the software through fp-util.
####
# Directory to be used for Framework CI test
export FPUTIL_DEPLOYS="${FPRIME_DIR}"

export SCRIPT_DIR="$(dirname ${BASH_SOURCE})/.."
. "${SCRIPT_DIR}/helpers.bash"
. ${SCRIPT_DIR}/tests/fputil.bash

export CMAKE_EXTRA_SETTINGS=""
echo -e "${BLUE}Testing ${FPUTIL_DEPLOYS} against fprime-util targets: ${FPUTIL_TARGETS[@]}${NOCOLOR}"
export CHECK_TARGET_PLATFORM="native"
for target in "${FPUTIL_TARGETS[@]}"
do
    if [[ "${target}" == "generate" ]]
    then
        rm -rf "${FPUTIL_DEPLOYS}/build-fprime-automatic-"*
    fi
    fputil_action "${FPUTIL_DEPLOYS}" "${target}"
done