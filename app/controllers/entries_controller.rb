class EntriesController < ApplicationController


  # Show detailed view for a single entry
  def show
    @entry = Entry.find_by({"id" => params["id"]}) # Find the entry by its ID
  end

  def new
    # Find the place we're adding a new entry for using the ID from the URL.
    @place = Place.find_by({ "id" => params["place_id"] })
    
  end
  

  # Process the form submission for a new entry
  def create
    @entry = Entry.new
    # Assign values from the form to the new entry
    @entry.title = params["title"]
    @entry.description = params["description"]
    @entry.posted_on = params["posted_on"]
    @entry.place_id = params["place_id"]

    if @entry.save
      redirect_to "/places/#{@entry["place_id"]}" # Redirect to the place's page showing its entries
    else
      @places = Place.all # In case saving fails, reload the form with existing place options
      render :new
    end
  end

  # Display a form for editing an existing entry
  def edit
    @entry = Entry.find_by("id" => params["id"]) # Find the entry to edit
    @places = Place.all # Fetch all places in case the user wants to change the entry's place
  end

  # Process the form submission for updating an existing entry
  def update
    @entry = Entry.find_by("id" => params["id"])
    if @entry.update(title: params["title"], description: params["description"], posted_on: params["posted_on"], place_id: params["place_id"])
      redirect_to place_path(@entry.place_id) # Redirect to the place's page showing its entries
    else
      @places = Place.all # In case updating fails, reload the form with existing place options
      render :edit
    end
  end

  # Delete an existing entry
  def destroy
    @entry = Entry.find_by("id" => params["id"]) # Find the entry to delete
    place_id = @entry.place_id # Store the place_id for redirection after deletion
    @entry.destroy # Delete the entry
    redirect_to place_path(place_id) # Redirect to the place's page to show remaining entries
  end

end


