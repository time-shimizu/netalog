class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  validates :profile, length: { maximum: 200 }

   def self.find_for_oauth(auth)
     user = User.where(uid: auth.uid, provider: auth.provider).first
     unless user
       user = User.create(
         uid:      auth.uid,
         provider: auth.provider,
         email:    auth.info.email,
         name:  auth.info.name,
         password: Devise.friendly_token[0, 20],
         image:  auth.info.image
       )
     end
     user
   end
end
