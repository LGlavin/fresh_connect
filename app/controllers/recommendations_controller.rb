class RecommendationsController < ApplicationController
  def create
    if current_user
      market = Market.find(params[:market_id])
      recommendation = Recommendation.new
      recommendation.user_id = current_user.id
      recommendation.market_id = market.id
      if recommendation.save
        redirect_to(:back, notice: "You recommended #{market.name}")
      else
        redirect_to(:back, notice: "You already recommended #{market.name}")
      end
    else
      redirect_to(:back, notice: "You must sign in to recommend farmer's markets")
    end
  end
end
