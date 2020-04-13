module ApplicationHelper

  def full_title(page_title)
    base_title = "わらログ"
    if page_title.blank?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def average_score(micropost)
    sum = micropost.scores.sum(&:point)
    count = Score.where('cast(micropost_id as text) LIKE ?', "#{micropost.id}").count
    if count != 0
      (sum * 1.0/count * 1.0 ).round(1)
    else
      0
    end
  end
end
