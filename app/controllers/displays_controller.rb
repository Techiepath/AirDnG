class DisplaysController < ApplicationController

	def index
    @user = current_user
    @places = current_user.places
  
    @reservations = Reservation.includes(:place)
                                .where(user_id: current_user.id)
                                .order("check_in")
    @current_reservations = @reservations.current_reservations
    @pending_reservations = @reservations.pending_reservations
    @past_reservations = @reservations.past_reservations
  end
end
