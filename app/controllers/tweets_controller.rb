class TweetsController < ApplicationController

  get "/tweets" do
    if logged_in?
      @tweets = Tweet.all
      erb :'/tweets/tweets'
    else
      redirect '/login'
    end
  end

  get "/tweets/new" do
    if logged_in?
      erb :'/tweets/new'
    else
      redirect '/login'
    end
  end

  post "/tweets" do
    if params["content"].empty?
      redirect '/tweets/new'
    else
      Tweet.create(:content => params[:content], :user_id => current_user.id)
      redirect '/tweets'
    end
  end

  get "/tweets/:id" do
    @tweet = Tweet.find(params[:id])
    erb :'/figures/show'
  end





  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
