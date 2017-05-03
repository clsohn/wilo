class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new; end
end
