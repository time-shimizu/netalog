class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order('created_at desc').page(params[:page]).per(5)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(10)
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
    render 'show_follow'
  end

  def sample
    sample_user = User.find_by(name: "サンプルユーザー")
    sign_in sample_user
    flash[:success] = "サンプルユーザーでのログインに成功しました"
    redirect_to sample_user
  end
end
