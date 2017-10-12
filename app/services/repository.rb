class Repository
  attr_reader :name, :full_name, :url, :updated_at, :stargazers_count, :language
  def initialize(attrs = {})
    @name = attrs[:name]
    @full_name = attrs[:full_name]
    @url = attrs[:html_url]
    @updated_at = attrs[:updated_at]
    @stargazers_count = attrs[:stargazers_count]
    @language = attrs[:language]
  end
end
