class Reservation < ActiveRecord::Base
	belongs_to :place
	belongs_to :user
	

  def self.current_reservations
    self.select do |reservation| 
      reservation.status == "approved" && reservation.check_out > Date.today
    end
  end

  def self.pending_reservations
    self.select do |reservation|
      reservation.status == nil && reservation.check_in > Date.today
    end
  end

  def self.past_reservations
    self.select do |reservation|
      reservation.check_out < Date.today
    end
  end



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
