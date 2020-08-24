#!/bin/bash
REGISTER_FILE="register.txt"

function register_call() {
  if [[ "${SHUNIT_TMPDIR}" ]]; then
    echo "$(basename "$0") $@" >>"${SHUNIT_TMPDIR}/${REGISTER_FILE}"
  fi
}

function verify_call() {
  if [[ "${SHUNIT_TMPDIR}" ]]; then
    sync
    grep -F -c "$@" "${SHUNIT_TMPDIR}/${REGISTER_FILE}" >/dev/null
    return $?
  fi
}

register_call "$@"
