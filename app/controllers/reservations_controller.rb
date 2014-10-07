class ReservationsController < ApplicationController
  
  def new 
    @reservation = Reservation.new
  end
  
  def create
     @reservation = Reservation.create(reservation_params)
    if @reservation.save
      redirect_to place_reservations_path, :notice => "Successfully booked this place"
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
      redirect_to place_reservations_path, :notice => "Reservation updated!"
    else
      render :action => 'edit'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_url, :notice => "Successfully destroyed reservation."
  end

   
  def show
    @reservation = Reservation.find(params[:id])
  end

 
  def index
    @place = Place.find(params[:place_id])
    @accepted_reservations = Reservation.includes(:user).where(place_id: params[:place_id], status: "accepted")
    @rejected_reservations = Reservation.includes(:user).where(place_id: params[:place_id], status: "rejected")
    @pending_reservations = Reservation.includes(:user).where(place_id: params[:place_id], status: nil)
  end
  


 def reject
    @reservation = Reservation.find_by_id(params[:id])
    if @reservation.place.owner_id == current_user.id
      @reservation.update_status("reject")
    end
    redirect_to(:back)
  end

  def accept
    @reservation = Reservation.find_by_id(params[:id])
    if @reservation.place.owner_id == current_user.id
      @reservation.update_status("accept")
    end

    redirect_to(:back)
  end

  private
    def reservation_params
      params.require(:reservation).permit(:check_in, :check_out, :user_id, :place_id, :status)
    end
    
end
