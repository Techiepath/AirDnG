class Reservation < ActiveRecord::Base
	belongs_to :place
	belongs_to :user
	

  def self.accepted_reservations
    self.select do |reservation| 
      reservation.status == "accepted" && reservation.check_out > Date.today
    end
  end

  def self.pending_reservations
    self.select do |reservation|
      reservation.status == nil && reservation.check_in > Date.today
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


  ####Cost####

  def duration
    (self.check_out - self.check_in).to_i
  end

  def total
    self.duration * place.price
  end


end
