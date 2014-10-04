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
    @approved_reservations = Reservation.includes(:user).where(place_id: params[:place_id], status: "approved")
    @denied_reservations = Reservation.includes(:user).where(place_id: params[:place_id], status: "denied")
    @pending_reservations = Reservation.includes(:user).where(place_id: params[:place_id], status: nil)   
  
    if params[:place_id]
      @place = Place.find_by_id(params[:place_id])

      if @place.owner.id == current_user.id
        render @reservation
      else
        flash[:notices] = ["You must log in as the owner of a space in order to view that page"]
        redirect_to @place 
      end
    else
      @user = User.find_by_id(current_user.id)

      render '"user/index/user"'
    end
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
