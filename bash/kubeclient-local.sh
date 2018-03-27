gem uninstall --ignore-dependencies --all kubeclient
rake build
gem install pkg/kubeclient*
# run other tests based on development gem
kubeclient-local.rb
