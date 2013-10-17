class MarketsController < ApplicationController
  def index
    @markets = Market.all
    @json = @markets.all.to_gmaps4rails 

  end

  def new
    @market = Market.new
  end

  def edit
  end

  def show
    @market = Market.all
  end

   def create
    @market = Market.new(market_params)
    if @market.save
      flash[:notice] = "Market was successfully recorded!"
      redirect_to new_market_path
    else
      render :new
  end
end

 def update
  @market = Market.find(params[:id])
   @market.edit
     redirect_to market_path, notice: 'Market was updated!'
 end

  def destroy 
    @market = Market.find(params[:id])
    @market.destroy
     redirect_to market_path, notice:'Market was successfully deleted'
 end 
 

  def market_params
  params.require(:market).permit(:name, :description, :address, :datetime)
  end
end



# geocoded_by :address
# er_validation :geocode, :if => :address_changed?

