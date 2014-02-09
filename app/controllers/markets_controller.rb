class MarketsController < ApplicationController
  
  def index
      if params[:search].present?
      @markets = Market.near(params[:search])
     else
       @markets = Market.all
   end
end
  
  def new
    @market = Market.new
  end
  

   def create
    @market = Market.new(market_params)
    if @market.save!
      flash[:notice] = 'You created a market successfully!'
      redirect_to market_path(@market)
    else
      render :new
  end
end


  def show
     @market = Market.find(params[:id])
  end

 

  def market_params
  params.require(:market).permit(:name,:address,:city,:state,:postal_code)
  end
end

