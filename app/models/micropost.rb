class Micropost < ApplicationRecord
  validates :user_id, presence: true
  validates :title,   presence: true
  validates :content, presence: true
  belongs_to :user
  belongs_to :subcategory
  has_many :scores, dependent: :destroy

  def self.search(search)
    if search
      Micropost.where(['content LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Micropost.all
    end
  end
end
