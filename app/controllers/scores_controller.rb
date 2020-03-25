class ScoresController < ApplicationController
  before_action :authenticate_user!
  def create
    score = Score.new(score_params)
    @micropost = Micropost.find(params[:micropost_id])
    score.user_id = current_user.id
    score.micropost_id = @micropost.id

    if score.save
      flash[:success] = "採点しました"
      @micropost.averagescore = average_score(@micropost)
      @micropost.save
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

   def average_score(micropost)
     sum = 0
     micropost.scores.each do |score|
       sum += score.point
     end
     count = Score.where('micropost_id LIKE ?', "#{micropost.id}").count
     if count != 0
       (sum * 1.0/count * 1.0 ).round(1)
     else
       0
     end
   end
end
