require 'rails_helper'

describe GithubService do
  context 'class methods' do
    context 'initialize' do
      it "exists" do
        expect(GithubService.new).to be_a GithubService
      end
    end
  end
end
