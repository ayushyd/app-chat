module Timestampbale
	extend ActiveSupport::Concern

	included do
		before_save :update_timestamps
	end

	def update_timestamps
		self.updated_at = Time.current
	end
end 