class TweetsController < ApplicationController
  before_action :authenticate_user! 
    def index
      @tweets = Tweet.all
      @comments = Comment.where(tweet_id: params[:tweet_id]) # 適切な条件を指定
    end

    def new
        @tweet = Tweet.new
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
  @comments = @tweet.comments
  @comment = Comment.new
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

def advice
  @posts = Post.all
end

def trouble
  @posts = Post.all
end

def top
end

def nomikai
end

def jousi
end

def date
end

def syotaimen
end

def kyoutsuu
end


private
  def tweet_params
    params.require(:tweet).permit(:body, :image)
  end

  private
  def post_params
    params.require(:post).permit(:cotent,:category) #categoryを追加
  end

  

end
