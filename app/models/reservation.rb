class Reservation < ActiveRecord::Base
	belongs_to :guest, class_name: "User"
  	belongs_to :place
    
    validates :check_in, :check_out, :presence => true


  
end
