class PlacesController < ApplicationController
	before_action :authenticate_user!, except: [:index]
  	
	def index
		@places = Place.all.order("created_at DESC")
	end

	def new
		@place = Place.new
	end

	def show
		@place = Place.find(params[:id])
		@reservation = Reservation.new
	end
	def edit
		@place = Place.find(params[:id])
	end

	def create
    	@place = current_user.places.build(place_params)
    if @place.save
      redirect_to @place, notice: 'Your place can now be rented!'
    else
      render action: 'new'
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_url
  end

	def place_params
		params.require(:place).permit(:kind, :address, :state, :price, :description, :availability)
	end
end