class OtherUser
  attr_reader :username, :name, :profile_picture, :bio, :location
  def initialize(attrs = {})
    @username = attrs[:login]
    @name = attrs[:name]
    @profile_picture = attrs[:avatar_url]
    @bio = attrs[:bio]
    @location = attrs[:location]
  end
end
