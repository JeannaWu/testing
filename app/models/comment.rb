class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :club
  acts_as_votable
end
