class Repository
  attr_reader :name, :url, :updated_at, :language
  def initialize(attrs = {})
    @name = attrs[:name]
    @url = attrs[:html_url]
    @updated_at = attrs[:updated_at]
    @language = attrs[:language]
  end
end
