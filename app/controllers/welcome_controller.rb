class WelcomeController < ApplicationController
   def index
    if params[:search].present?
      @locations = Location.near(params[:search]) #, 50, :order => :distance)
    else
       @locations = Location.all
       @json = @locations.all.to_gmaps4rails 
    end
  end
  end

