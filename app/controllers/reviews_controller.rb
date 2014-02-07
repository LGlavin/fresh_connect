class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @market = Market.find(params[:market_id])
  end

  def index
    if params[:market_id]
      @market = Market.find( params[:market_id])
      @reviews = Review.where( market_id: @market.id)
    else 
      @market = nil
      @reviews = Review.all 
   end
end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id 
    @market = Market.find(params[:market_id])
    @review.market_id = @market.id 

    if @review.save
      flash[:notice] = 'Thank you for your review!'
      redirect_to market_reviews_path(@market)
    else
      render :new 
    end
  end

  

protected
  def review_params
    params.require(:review).permit(:body, :market_id)
  end
end