class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:prefecture].present?
      session[:prefecture] = params[:prefecture] #セッションにprefectureの情報を保持しておく
    elsif params[:clear_prefecture].present?
      session.delete(:prefecture)
    end


    @tweets = Tweet.all


    if session[:prefecture].present?
      @tweets = @tweets.where("address LIKE ? ",'%' + session[:prefecture] + '%') #セッションに保持されているprefectureの値で検索
    end
    if params[:search] != nil && params[:search] != ''
      search = params[:search]
      @tweets = @tweets.where("name LIKE ? OR address LIKE ?", "%#{search}%", "%#{search}%")
    end
  end

    def new
      @tweet = Tweet.new
      @tweets = Tweet.all
    end

     def create
        tweet = Tweet.new(tweet_params)
        tweet.user_id = current_user.id
        if tweet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @tweet = Tweet.find(params[:id])
      end

      def edit
        @tweet = Tweet.find(params[:id])
      end

      def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
      end

      def top
      end

      def set_custom_time
        @tweet = Tweet.find(params[:id])
        @like = @tweet.likes.find_by(user: current_user)
        if @like.update(custom_time: params[:custom_time])
          render json: { status: 'success' }
        else
          render json: { status: 'error' }, status: :unprocessable_entity
        end
      end
      
    
      private
      def tweet_params
        params.require(:tweet).permit(:name, :address, :opentime, :endtime, :dayoff, :peaktime, :access, :photo, :latitude, :longitude, :budget, tag_ids: [])
      end
      
end

