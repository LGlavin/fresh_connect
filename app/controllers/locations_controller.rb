class LocationsController < ApplicationController
  
  def index
    @locations = if search_value.present?
                  Location.near(search_value)
                else
                  Location.all
                end
              end
            


  #   if params[:search].present?
  #    @locations = Locations.near(params[:search], 100, :order => :distance)
      
  #   else
  #     @locations = Location.all
  #   end
  # end 
  
   private
    def search_value
      params[:search] && params[:search][:value]
    end

  # def new
  #   @location = Location.new
  # end

  # def show
  #   @location = Location.find(params[:id])
  # end
end


