cat <<EOF |./output.sh 2>&1
OUT=$(
aaa
EOF
)

RC=$?;
echo "OUT: ${OUT}"
echo "RC: ${RC}"
