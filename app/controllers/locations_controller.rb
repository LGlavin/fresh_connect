class LocationsController < ApplicationController
  
def index
  if params[:search].present?
    @locations = Location.near(params[:search], 50, :order => :distance)
  else
    @locations = Location.all
   @json = User.all.to_gmaps4rails
  end
end

    def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end
  
  def create
    @location = Location.new(params[:location])
    if location.save 
      reirect_to @location, :notice => "Successfully created location"
    else 
      render :action => 'new'
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
end

  def location_params
    params.require(:location).permit(:name, :address, :city, :postal_code)
  end

 