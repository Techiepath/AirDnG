class Reservation < ActiveRecord::Base
	belongs_to :place
	belongs_to :user
	


	def update_status(method)
    self.public_send(method)
  end

  def set_status(status)
    self.update_attributes!(status: status)
  end



  def reject
    self.status = "denied"
    self.save!
  end



  def accept
     self.status = "approved"
      self.save!
    
  end

end
