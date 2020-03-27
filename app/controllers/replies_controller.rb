class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def create
    reply = current_user.replies.build(reply_params)
    micropost = Micropost.find(params[:micropost_id])
    reply.micropost_id = micropost.id
    if reply.save
      redirect_to micropost
    else
      flash[:danger] = "返信内容を入力してください"
      redirect_to micropost
    end
  end

  def destroy
    micropost = @reply.micropost
    @reply.destroy
    flash[:success] = "返信を削除しました"
    redirect_to micropost
  end

  private

    def reply_params
      params.require(:reply).permit(:content)
    end

    def correct_user
      @reply = Reply.find(params[:id])
      redirect_to root_url unless @reply.user == current_user
    end
end
