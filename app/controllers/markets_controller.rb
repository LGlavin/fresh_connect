class MarketsController < ApplicationController
  
  def index
      if params[:search].present?
      @markets = Market.near(params[:search]).page(params[:page]).per(5)
   else
    @markets = Market.all.page(params[:page]).per(5)
  end
end


  def new
    @market = Market.new
  end
  

   def create
    @market = Market.new(market_params)
    if @market.save
      flash[:notice] = 'Thank for adding your market to the list!'
      redirect_to markets_path(@market)
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

