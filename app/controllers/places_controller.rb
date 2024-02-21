class PlacesController < ApplicationController

  # Display a list of all places
  def index
    @places = Place.all
  end

  # Show detailed view for a single place, including its entries
  def show
    @place = Place.find_by("id" => params["id"]) # Find the place by its ID
    @entries = Entry.where("place_id" => @place.id) # Get all entries for this place
  end

  # Display a form for creating a new place
  def new
  end

  # Process the form submission for a new place
  def create
    @place = Place.new
    @place.name = params["name"] # Assign the name from the form to the new place
    @place.save # Save the new place
    redirect_to places_path # Redirect to the list of all places
  end

end

