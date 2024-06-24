class Artice < ApplicationRecord
	include Timestampbale
	belongs_to :user
	# scope :for_user, ->(user) { where(user: user) }

	validates_presence_of :title, message: "Title Can't be blank!"
end
