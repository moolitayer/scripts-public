#!/bin/bash
set -x

bundle exec bin/rake evm:kill evm:db:reset db:seed &&
miq-setup.sh