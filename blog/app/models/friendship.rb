class Friendship < ActiveRecord::Base

	belongs_to :blast_user
	belongs_to :friend, :class_name => "BlastUser"

end
