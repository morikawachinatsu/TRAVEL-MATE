class PostsController < ApplicationController
  def index
      start_date = params.fetch(:start_date, Date.today).to_date
      @events = Post.where('start_time <= ? AND (end_time >= ? OR end_time IS NULL)', start_date.end_of_month.end_of_week, start_date.beginning_of_month.beginning_of_week)

  end

  def new
    @post = Post.new(start_time: params[:date]) # 選択した日付をデフォルト値に設定
  end
  def create
      post = Post.new(post_params)
      if post.save
          redirect_to :action => "index"
      else
          redirect_to :action => "new"
      end
  end
  def show
      @post = Post.find(params[:id])
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      post = Post.find(params[:id])
      if post.update(post_params)
          redirect_to :action => "show", :id => post.id
      else
          redirect_to :action => "new"
      end
  end

  def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to action: :index
  end

  private
  def post_params
      params.require(:post).permit(:title,:start_time,:end_time)
  end

end