class RunRegistry
	extend ActiveSupport::PerThreadRegistry

	attr_accessor :is_running
end
