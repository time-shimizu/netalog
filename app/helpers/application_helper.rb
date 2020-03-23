module ApplicationHelper
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
