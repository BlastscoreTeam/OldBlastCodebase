class BlastUser < ActiveRecord::Base
	has_many :ratings
	#has_many :blast_users
	#has_many :friends, class_name: 'BlastUser', foreign_key: "blast_user_id"
	#belongs_to :friendlies, class_name: 'BlastUser'
	#serialize :friendArray, Array
	validates :username, presence:  true
	#validates :encrypted_password, :confirmation => true #password_confirmation attr
	#validates_length_of :encrypted_password, :in => 6..20, :on => :create
	#validates :blast_user_id, presence:  true
	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user
end
