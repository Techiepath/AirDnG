class PlacesController < ApplicationController
def index
		@places = Place.all
	end

	def new
		@place = Place.new
	end

	def show
		@place = Place.find(params[:id])
	end

	def create
		if !user_signed_in?
			redirect_to new_user_session_path
		else
			@place = current_user.places.new(place_params)

			respond_to do |format|
				if @place.save
					format.html { redirect_to @place, notice: 'Pet was successfully created.' }
					format.json { render action: 'show', status: :created, location: @place }
				else
					format.html { render action: 'new' }
					format.json { render json: @place.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	def place_params
		params.require(:place).permit(:kind, :address, :state, :price, :description, :availability)
	end
end