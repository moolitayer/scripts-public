OUT=$(
cat <<EOF |./output.sh 2>&1
aaa
EOF
)

RC=$?;
echo "OUT: ${OUT}"
echo "RC: ${RC}"
