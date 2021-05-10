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
    erb :'/tweets/new'
  end

  post "/tweets" do
    Tweet.create(:content => params[:content], :user_id => current_user.id)
    eredirect '/tweets'
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
