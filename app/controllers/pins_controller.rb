class PinsController < ApplicationController
  def index
  	@pins= Pin.all
  end

  def new
  	@pin = Pin.new
  end

##added notes from Elie lecture
  def create
  	@pin = Pin.new(pin_params)
  	@pin.save
  	if (@pin.save)
  		redirect_to pins_path
  	else
  		render :new
  	end
  end

  def show
  	@pin = Pin.find_by_id params[:id]
  end

  def edit
  	@pin = Pin.find_by_id params[:id]
  end

  def update
  	@pin = Pin.find_by_id params[:id]
  	redirect_to
  end

  def destroy
  	@pin = Pin.find_by_id params[:id]
  	@pin.destroy
  	redirect_to pins_path
  end

  private

  def pin_params
  	params.require(:pin).permit(:name, :url,:image,:comment)
  end
end
