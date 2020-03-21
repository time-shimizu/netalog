class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all
  end

  def show
    @micropost = Micropost.find(params[:id])
    @user = @micropost.user
  end

  def new
    @micropost = current_user.micropsts.build(micropost_params)
    youtube_url = params[:micropost][:url]
    youtube_url = youtube_url.last(11)
    @post.url = youtube_url

    if @post.save
      flash[:success] = "投稿が完了しました"
      redirect_to @post
    else
      flash[:danger] = "投稿に失敗しました"
      render "new"
    end
  end

  def edit
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content, :url, :title)
  end
end
