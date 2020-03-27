class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  validates :profile, length: { maximum: 200 }
  mount_uploader :image, ImageUploader
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :replies, dependent: :destroy

   def self.find_for_oauth(auth)
     user = User.where(uid: auth.uid, provider: auth.provider).first
     unless user
       user = User.create(
         uid:      auth.uid,
         provider: auth.provider,
         email:    User.dummy_email(auth),
         name:  auth.info.name,
         password: Devise.friendly_token[0, 20],
         remote_image_url:  auth.info.image.gsub("picture","picture?type=large")
       )
     end
     user
   end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

   private

    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end
end
