class Reservation < ActiveRecord::Base
	belongs_to :guest
  	belongs_to :place
    
    validates :check_in, :check_out, :presence => true


  
end
