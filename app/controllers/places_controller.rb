class PlacesController < ApplicationController
	
  before_action :authenticate_user!, except: [:index]
	
  	
	def index
		@places = Place.all.order("created_at DESC")
	end

	def new
		@place = current_user.places.build
	end

  def create
      @place = current_user.places.build(place_params)
    if @place.save
      redirect_to @place, notice: 'Your place can now be rented!'
    else
      render action: 'new'
    end
  end

	def show
		@place = Place.find(params[:id])

  end

    
	
	def edit
		@place = Place.find(params[:id])
	end
  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to @place, notice: 'Your place was successfully updated.'
    else
      render action: 'edit'
    end
  end

	

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_url
  end

  private
  	def set_place
      @place = Place.find(params[:id])
    end
    def correct_user
      @place = current_user.places.find_by(id: params[:id])
      redirect_to placess_path, notice: "Not authorized to edit this place" if @place.nil?
    end

	def place_params
		params.require(:place).permit(:kind, :address, :state, :price, :description, :title)
	end
end