class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path
    else
      render :new
    end
  end

  private  # The place_params method securely filters user input to allow only specified attributes (in this case, :name) for mass assignment to a model, protecting the application from potential security vulnerabilities.

  def place_params
    params.require(:place).permit(:name)
  end
end
