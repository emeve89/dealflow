class Task < ActiveRecord::Base
	belongs_to :client
	belongs_to :deal
end
