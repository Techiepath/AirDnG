class ReservationsController < ApplicationController
  
  
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      
      redirect_to @reservation, :notice => "Reservation Created!"
    else
      redirect_to "back", :notice => "Unable to add reservation!"
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to "/reservationsedit", :notice => "Reservation updated!"
    else
      redirect_to "/reservationsedit", :notice => "Unable to update reservation!"
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    if reservation.destroy
      redirect_to "/reservationsedit", :notice => "Reservation Removed!"
    else
      redirect_to "/reservationsedit", :notice => "Unable to remove Reservation!"
    end
  end

 



 

  private
    def reservation_params
      params.require(:reservation).permit(:place_id, :guest_id, :check_in, :check_out)
    end
    
end