class Club < ActiveRecord::Base
	has_many :posts
	has_many :users
	has_many :comments

	acts_as_followable
	
end
