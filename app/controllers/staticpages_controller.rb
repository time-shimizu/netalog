class StaticpagesController < ApplicationController
  def home
    @users = User.find(Relationship.group(:followed_id).order('count(followed_id) desc').limit(4).pluck(:followed_id))
    @new_post = Micropost.all.order('created_at desc').take(3)
    @popular_post = Micropost.all.order('averagescore desc').take(3)
  end
end
