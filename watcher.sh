#! /bin/bash

source ./task-logger.sh/task-logger.sh

F="report.tex"

wait_for_modification() {
  local now back_then
  back_then="$1"
  while true; do
    now=$(stat -c "%Y" "$F")
    if [ "$now" -gt "$back_then" ]; then
      echo "$now"
      return 0
    fi
    sleep 1
  done
}

generate_pdf() {
  yes R | make
}

error_pdf() {
  ko
  sed -n '/^!/,/^?/p' "$LOG_DIR/latex.out"
}

WHEN=0
while true; do
  working -n "Watching $F"
  log_cmd -o watch wait_for_modification "$WHEN" || ko
  WHEN=$(stat -c "%Y" "$F")
  working -n "Generating PDF"
  log_cmd -o latex generate_pdf || error_pdf
done

finish
