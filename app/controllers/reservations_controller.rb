class ReservationsController < ApplicationController
  
  def index
    @reservation = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = current_user.reservations.build
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      redirect_to @reservation, :notice => "Successfully booked this place"
    else
      render :action => 'new'
    end
  end




  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to reservations_path, :notice => "Reservation updated!"
    else
      render :action => 'edit'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_url, :notice => "Successfully destroyed reservation."
  end

 



 

  private
    def reservation_params
      params.require(:reservation).permit(:check_in, :check_out)
    end
    
end