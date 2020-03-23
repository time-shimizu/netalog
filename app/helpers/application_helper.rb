module ApplicationHelper
  def average_score(micropost)
    sum = 0
    micropost.scores.each do |score|
      sum += score.point
    end
    count = Score.where('micropost_id LIKE ?', "#{micropost.id}").count
    if count != 0
      (sum/count).round
    else
      0
    end
  end
end
