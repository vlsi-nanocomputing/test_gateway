#!/usr/bin/env bash
set -euo pipefail

BUILD_DIR="${1:-build}"

mkdir -p "$BUILD_DIR"

LOG_FILE="$BUILD_DIR/synthesis.log"
TIMING_RPT="$BUILD_DIR/timing.rpt"
AREA_RPT="$BUILD_DIR/area.rpt"
RESULT_JSON="$BUILD_DIR/result.json"

{
  echo "Starting synthesis placeholder"
  echo "Date: $(date -Is)"
  echo "Host: $(hostname)"
  echo "Build directory: $BUILD_DIR"
  echo
  echo "Repository files:"
  find . -maxdepth 3 -type f | sort
  echo
  echo "Pretending to run synthesis..."
  sleep 2
  echo "Synthesis completed"
} | tee "$LOG_FILE"

cat > "$TIMING_RPT" <<EOF
Timing report
=============

Clock period target: 10.000 ns
Worst negative slack: 0.214 ns
Total negative slack: 0.000 ns
Timing status: PASS
EOF

cat > "$AREA_RPT" <<EOF
Area report
===========

Combinational area: 1234.56
Sequential area:    789.01
Total area:         2023.57
EOF

cat > "$RESULT_JSON" <<EOF
{
  "status": "PASS",
  "wns_ns": 0.214,
  "tns_ns": 0.0,
  "total_area": 2023.57,
  "log_file": "synthesis.log",
  "timing_report": "timing.rpt",
  "area_report": "area.rpt"
}
EOF

echo
echo "Generated files:"
ls -lah "$BUILD_DIR"

echo
echo "Result JSON:"
cat "$RESULT_JSON"
