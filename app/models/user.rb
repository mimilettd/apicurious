class User < ApplicationRecord
  def self.create_with_omniauth(auth)
    where(uid: auth[:uid]).first_or_create do |new_user|
      new_user.provider = auth["provider"]
      new_user.uid = auth["uid"]
      new_user.name = auth["info"]["name"]
      new_user.username = auth["extra"]["raw_info"]["login"]
      new_user.token = auth["credentials"]["token"]
      new_user.profile_picture = auth["extra"]["raw_info"]["avatar_url"]
      new_user.bio = auth["extra"]["raw_info"]["bio"]
      new_user.location = auth["extra"]["raw_info"]["location"]
      new_user.email = auth["extra"]["raw_info"]["email"]
    end
  end

  def to_param
    "#{self.username}"
  end
end
