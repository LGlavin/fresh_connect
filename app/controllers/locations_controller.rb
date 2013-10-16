class LocationsController < ApplicationController
  
def index
  if params[:search].present?
    @locations = Location.near(params[:search])#, 5, :order => :distance)
 
  else
    @locations = Location.all
   #@json = User.all.to_gmaps4rails
  end
end

    def new
    @location = Location.new
  end

  def show
    @location = Location.find_by(params[:id])
    @markets = @location.markets
    @new_market = Market.new
  end
  
  def create
    @location = Location.new(location_params)
    if location.save 
     flash[:notice] = "location was successfully recorded!"
      redirect_to new_location_path
    else
      render :new
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

 