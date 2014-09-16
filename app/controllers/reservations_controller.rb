class ReservationsController < ApplicationController
def create
    redirect_to places_path
    Reservation.create(guest: current_user, place: Place.find(params[:place_id]))

  end

  def reject
    load_reservation.reject!
    redirect_to places_path
  end

  def accept
    load_reservation.accept!
    redirect_to places_path
  end

  private

  def load_reservation()
    current_user.visits.find(params[:id])
  end

end
