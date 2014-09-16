class GuestsController < ApplicationController

	def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(params[:guest])
    if @guest.save
      redirect_to @guest, :notice => "Successfully created patient."
    else
      render :action => 'new'
    end
  end

 

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
  end
end

