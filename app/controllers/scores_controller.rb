class ScoresController < ApplicationController
  before_action :authenticate_user!
  def create
    score = Score.new(score_params)
    @micropost = Micropost.find(params[:micropost_id])
    score.user_id = current_user.id
    score.micropost_id = @micropost.id

    if score.save
      flash[:success] = "採点しました"
      redirect_to @micropost
    else
      flash[:danger] = "失敗しました"
      redirect_to @micropost
    end
  end

  def destroy
  end

  private
   def score_params
     params.require(:score).permit(:point)
   end
end
