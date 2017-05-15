MIQ_PATH=${PREFIX}/manageiq
PLUGIN_PATH=${MIQ_PATH}/plugins

git --git-dir ${MIQ_PATH}/.git fetch
git --git-dir ${PLUGIN_PATH}/manageiq-ui-classic/.git fetch
git --git-dir ${PLUGIN_PATH}/manageiq-automation_engine/.git fetch
git --git-dir ${PLUGIN_PATH}/manageiq-content/.git fetch
git --git-dir ${PLUGIN_PATH}/manageiq-providers-hawkular/.git fetch
git --git-dir ${PLUGIN_PATH}/manageiq-providers-kubernetes/.git fetch
git --git-dir ${PLUGIN_PATH}/manageiq-providers-openshift/.git fetch


