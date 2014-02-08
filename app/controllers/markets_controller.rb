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

  def show
     @market = Market.find(params[:id])
     @reviews = Review.where(market_id: @market.id)
    @review = Review.where(market_id: @market.id, user_id: current_user.id).first
    if @review.nil?
      @review = Review.new
      @review.build_comment
  end
end
  

   def create
    @market = Market.new(market_params)
    if @market.save
      flash[:notice] = 'You created a market successfully!'
      redirect_to new_market_path
    else
      render :new
  end
end

 

  def market_params
  params.require(:market).permit(:name,:address,:city)
  end
end

