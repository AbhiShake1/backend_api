#!/usr/bin/env bash

if [ -n "$DEBUG" ]; then
	set -x
fi

set -o errexit
set -o nounset
set -o pipefail

echo "[unit-test] Run backend_api unit tests."
POETRY_HOME="${POETRY_HOME:=${HOME}/.poetry}"
"$POETRY_HOME"/bin/poetry run pytest tests/unit
