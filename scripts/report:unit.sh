#!/usr/bin/env bash

# TODO: Move all of this js stuff into a node module
# Tests the binary file scripts/prevent_clobber.js

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P )"
SCRIPTS_DIR="${SCRIPTS_DIR:?}"
ROOT_DIR="$(realpath "${SCRIPTS_DIR}/..")"
UNIT_DIR="${ROOT_DIR}/test/unit"
REPORT_DIR="${ROOT_DIR}/reports/unit"
MARKDOWN_FILE="${ROOT_DIR}/reports/report:unit.md"

yarn mocha \
  --recursive \
  --reporter=mochawesome \
  --reporter-options reportDir=${REPORT_DIR} \
  "${UNIT_DIR}" \
  && \
yarn -s mochawesome_to_markdown \
  --mochawesome "${REPORT_DIR}/mochawesome.json" > ${MARKDOWN_FILE}