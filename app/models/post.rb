class Post < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	belongs_to :club
	has_many :comments
	has_attached_file :image, styles: { medium: "550x300#", small: "350x250#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
