class User < ActiveRecord::Base
  has_many :listings

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
