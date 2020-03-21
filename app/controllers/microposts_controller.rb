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
  end

  def edit
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content, :url, :title)
  end
end
