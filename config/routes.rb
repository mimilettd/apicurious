Rails.application.routes.draw do
  root to: "home#index"
  get "/auth/github/callback" => "sessions#create"
  delete "/signout" => "sessions#destroy", :as => :signout
end
