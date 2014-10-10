class DisplaysController < ApplicationController

	def index
    @user = current_user
    @places = current_user.places
  
    @reservations = Reservation.includes(:place)
                                .where(user_id: current_user.id)
                                .order("check_in")
    @accepted_reservations = @reservations.accepted_reservations
    @pending_reservations = @reservations.pending_reservations
    
    
  end
end
