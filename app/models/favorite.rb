class Favorite < ActiveRecord::Base

  belongs_to :carrier

  belongs_to :destination , :class_name => "Destination", :foreign_key => "destination_id"

  belongs_to :user , :class_name => "User", :foreign_key => "user_id"

end
