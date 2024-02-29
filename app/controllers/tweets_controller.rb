class TweetsController < ApplicationController
  def index
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  def create
    tweet = current_user.tweets.new(tweet_params)
  
    if tweet.save 
      flash[:success] = "Tweet successfully created!"
      redirect_to root_path
    else
      flash[:alert] = "Error creating tweet. Please try again."
      redirect_to root_path
    end
  end

  def update
    @tweet = current_user.tweets.find(params[:id])

    if @tweet.update(tweet_params)
      flash[:success] = "Tweet successfully updated!"
      redirect_to root_path
    else
      flash[:alert] = "Error updating tweet. Please try again."
      redirect_to root_path
    end
  end

  def destroy
    
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    redirect_to dashboard_path
  end

  private

  def tweet_params
    params.required(:tweet).permit(:body)
  end
end
