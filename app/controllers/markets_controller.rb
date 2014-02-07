class MarketsController < ApplicationController
  
  def index
      if params[:search].present?
      @markets = Market.near(params[:search])
     
      else
       @markets = Market.all
       @json = @markets.all.to_gmaps4rails 
   end
end
  
  def new
    @market = Market.new
  end

  def edit
     @market = Market.find(params[:id])
  end

#   def show
#      @market = Market.find(params[:id])
# end
  

   def create
    @market = Market.new(market_params)
    if @market.save
      flash[:notice] = 'You created a market successfully!'
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
  params.require(:market).permit(:name,:address)
  end
end

