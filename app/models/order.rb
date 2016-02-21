class Order < ActiveRecord::Base
	GENDERS = [ "Female", "Male","Other"]
            validates :gender, :inclusion => GENDERS
end
