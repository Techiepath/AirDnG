class Reservation < ActiveRecord::Base
	  belongs_to :guest, :class_name => 'User'
  		belongs_to :place

  def reject!
    update_attributes({"status" => "rejected"})
  end

  def accept!
    update_attributes({'status'=> 'accepted'})
  end

  def pending?
    status == "pending"
  end
end
