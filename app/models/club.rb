class Club < ActiveRecord::Base
	has_many :posts
	has_many :users
	has_many :comments

	validates :name,  presence: true, length: { maximum: 10}
	validates :description, presence: true, length: { maximum: 255 },
                    uniqueness: true

	acts_as_followable
	
end
