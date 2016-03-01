class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Paperclip::Glue
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :club
  has_many :posts
  has_many :comments
  
  acts_as_follower
  acts_as_followable
  
  has_attached_file :avatar,  styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  
  
  

   



end


