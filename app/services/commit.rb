class Commit
  attr_reader :repo_name, :weeks_commit
  def initialize(attrs = {}, repo_name)
    @repo_name = repo_name
    @weeks_commit = attrs[:owner][-1]
  end
end
