class EntriesController < ApplicationController
  before_action :set_place

  def index
    @entries = @place.entries
  end

  def new
    @entry = @place.entries.build
  end

  def create
    @entry = @place.entries.build(entry_params)
    if @entry.save
      redirect_to place_entries_path(@place)
    else
      render :new
    end
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :date)
  end
end
