exit -1

MIQ_PATH=${PREFIX}/manageiq
PLUGIN_PATH=${MIQ_PATH}/plugins

git --git-dir ${MIQ_PATH}/.git fetch
git --git-dir ${PLUGIN_PATH}/manageiq-ui-classic/.git fetch
git --git-dir ${PLUGIN_PATH}/manageiq-automation_engine/.git fetch
git --git-dir ${PLUGIN_PATH}/manageiq-content/.git fetch
git --git-dir ${PLUGIN_PATH}/manageiq-providers-hawkular/.git fetch
git --git-dir ${PLUGIN_PATH}/manageiq-providers-kubernetes/.git fetch
git --git-dir ${PLUGIN_PATH}/manageiq-providers-openshift/.git fetch


#
git --git-dir ${MIQ_PATH}/.git checkout upstream/master -B master
git --git-dir ${PLUGIN_PATH}/manageiq-ui-classic/.git checkout upstream/master -B master
git --git-dir ${PLUGIN_PATH}/manageiq-automation_engine/.git checkout upstream/master -B master
git --git-dir ${PLUGIN_PATH}/manageiq-content/.git checkout upstream/master -B master
git --git-dir ${PLUGIN_PATH}/manageiq-providers-hawkular/.git checkout upstream/master -B master
git --git-dir ${PLUGIN_PATH}/manageiq-providers-kubernetes/.git checkout upstream/master -B master
git --git-dir ${PLUGIN_PATH}/manageiq-providers-openshift/.git checkout upstream/master -B master
