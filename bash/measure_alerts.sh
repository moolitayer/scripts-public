die() {
	local m="${1}"
	echo "FATAL: ${m}" >&2
	exit 1
}

function get_initial_state {
  echo "hi"
}

function output_time() {
    local seconds_start="${1}"
    local seconds_now=$(date +%s)
    local now=$(date -d @${seconds_now} +"%T")
    echo "Clock: ${now}, $((seconds_now-seconds_start)) seconds since start."
}

function wait_for_change() {
    local title="${1}"
    local expression="${2}"
    echo "Waiting For change in: ${title}, ${expression}"
    local initial_value=$(eval "${expression}")
    local current_value="${initial_value}"
    echo "Initial Value is ${initial_value}"
    echo "Waiting..."
    while true; do
        # TODO dont run command too often
        current_value=$(eval "${expression}")
        echo "Current Value is ${current_value}"
        if [[ ${current_value} != ${initial_value} ]]; then
            break;
        fi
    done
    echo "Done!"
    echo "Changed value is ${current_value}"
}

#


#
# Main
#
SECONDS_START=$(date +%s)
output_time $SECONDS_START

wait_for_change "prometheus alert count" "curl -k -s -H \"Authorization: Bearer ${OPENSHIFT_MANAGEMENT_ADMIN_TOKEN}\" \"https://${OPENSHIFT_PROMETHEUS_METRICS_ROUTE}/api/v1/query?query=ALERTS\" |jq \".data.result | length\""
output_time $SECONDS_START

