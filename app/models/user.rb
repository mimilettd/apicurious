class User < ApplicationRecord
  def self.create_with_omniauth(auth)
    where(uid: auth[:uid]).find_or_create_by do |new_user|
      new_user.provider = auth["provider"]
      new_user.uid = auth["uid"]
      new_user.name = auth["info"]["name"]
      new_user.username = auth["extra"]["raw_info"]["login"]
      new_user.token = auth["credentials"]["token"]
      new_user.profile_picture = auth["extra"]["raw_info"]["avatar_url"]
      new_user.url = auth["extra"]["raw_info"]["url"]
      new_user.followers_url = auth["extra"]["raw_info"]["followers_url"]
      new_user.following_url = auth["extra"]["raw_info"]["following_url"]
      new_user.gists_url = auth["extra"]["raw_info"]["gists_url"]
      new_user.bio = auth["extra"]["raw_info"]["bio"]
      new_user.location = auth["extra"]["raw_info"]["location"]
      new_user.email = auth["extra"]["raw_info"]["email"]
      new_user.repo_url = auth["extra"]["raw_info"]["repos_url"]
      new_user.starred_url = auth["extra"]["raw_info"]["starred_url"]
      new_user.followers = auth["extra"]["raw_info"]["followers"]
      new_user.following = auth["extra"]["raw_info"]["following"]
      new_user.public_repos = auth["extra"]["raw_info"]["public_repos"]
      new_user.public_gists = auth["extra"]["raw_info"]["public_gists"]
    end
  end

  def to_param
    "#{self.username}"
  end
end
