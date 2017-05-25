worker_class = ManageIQ::Providers::Prometheus::DatawarehouseManager::EventCatcher
runner_class = worker_class::Runner

worker = worker_class.create_worker_record

runner_cfg = {:guid => worker.guid, :ems_id=>1000000000005}

runner = runner_class.new(runner_cfg)

runner.start
