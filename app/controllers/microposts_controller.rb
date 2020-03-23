class MicropostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @microposts = Micropost.page(params[:page]).per(5)
  end

  def show
    @micropost = Micropost.find(params[:id])
    @user = @micropost.user
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    youtube_url = params[:micropost][:url]
    youtube_url = youtube_url.last(11)
    @micropost.url = youtube_url

    if @micropost.save
      flash[:success] = "投稿が完了しました"
      redirect_to @micropost
    else
      flash[:danger] = "投稿に失敗しました"
      render "new"
    end
  end

  def edit
  end

  def update
    youtube_url = params[:micropost][:url]
    youtube_url = youtube_url.last(11)
    @micropost.url = youtube_url

    if @micropost.update_attributes(micropost_params)
      flash[:success] = "編集が完了しました"
      redirect_to @micropost
    else
      flash[:danger] = "編集に失敗しました"
      render "edit"
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to microposts_path
  end
  private

  def micropost_params
    params.require(:micropost).permit(:content, :url, :title, :subcategory_id)
  end

  def correct_user
    @micropost =Micropost.find(params[:id])
    redirect_to root_url unless @micropost.user == current_user
  end
end
