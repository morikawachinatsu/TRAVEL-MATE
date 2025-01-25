class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
    end
    def bookmark
        @user = User.find(params[:id]) 
    end
    def update_bookmarks_order
        params[:order].each do |item|
        like = Like.find(item[:id])
        like.update(position: item[:position])
        end
        
        head :ok
        end
        
    def update_canvas
        @user = current_user
        if @user.update(canvas_params)
            redirect_to bookmark_user_path(current_user.id), notice: 'Canvas was successfully updated.'
        else
            render :bookmarks
        end
        end
        
    def index
            @liked_tweets = current_user.liked_tweets
            @total_budget = @liked_tweets.sum(:budget)
        end

        def update_plan
            @post = Post.find(params[:id])
            if @post.update(plan_params)
            redirect_to posts_path, notice: '計画が更新されました'
            else
            redirect_to posts_path, alert: '計画の更新に失敗しました'
            end
        end

        def stamp
            @user = User.find(params[:id]) 
        
            
              @user.increment!(:stamps)
              
              new_level = (@user.stamps - 1) / 10 + 1
            @user.update!(level: new_level)
            
        
            redirect_to  user_path(current_user.id)
          end
       

          def remove_stamp
            @user = User.find(params[:id])
            
            if @user.stamps > 0
              @user.decrement!(:stamps) # スタンプを1つ減らす
              new_level = (@user.stamps - 1) / 10 + 1
              @user.update!(level: new_level) # レベルを再計算
            else
              flash[:alert] = "これ以上スタンプを戻せません。"
            end
          
            redirect_to user_path(current_user.id)
          end

    private
    def canvas_params
        params.require(:user).permit(:canvasdata)
    end

end
