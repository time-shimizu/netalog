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
         email:    User.dummy_email(auth),
         name:  auth.info.name,
         password: Devise.friendly_token[0, 20],
         image:  auth.info.image
       )
     end
     user
   end

   private

    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end
end
