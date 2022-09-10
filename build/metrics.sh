#!/usr/bin/env bash

if [ -n "$DEBUG" ]; then
	set -x
fi

set -o errexit
set -o nounset
set -o pipefail

POETRY_HOME="${POETRY_HOME:=${HOME}/.poetry}"
echo "[metrics] Run backend_api PEP 8 checks."
"$POETRY_HOME"/bin/poetry run flake8 --select=E,W,I --max-line-length 80 --import-order-style pep8 --statistics --count backend_api
echo "[metrics] Run backend_api PEP 257 checks."
"$POETRY_HOME"/bin/poetry run flake8 --select=D --ignore D301 --statistics --count backend_api
echo "[metrics] Run backend_api pyflakes checks."
"$POETRY_HOME"/bin/poetry run flake8 --select=F --statistics --count backend_api
echo "[metrics] Run backend_api code complexity checks."
"$POETRY_HOME"/bin/poetry run flake8 --select=C901 --statistics --count backend_api
echo "[metrics] Run backend_api open TODO checks."
"$POETRY_HOME"/bin/poetry run flake8 --select=T --statistics --count backend_api tests
echo "[metrics] Run backend_api black checks."
"$POETRY_HOME"/bin/poetry run black -l 80 --check backend_api
