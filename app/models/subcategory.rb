class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :microposts, dependent: :destroy
end
