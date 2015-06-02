class Destination < ActiveRecord::Base

  has_many :favorites , :class_name => "Favorite", :foreign_key => "destination_id"

end
