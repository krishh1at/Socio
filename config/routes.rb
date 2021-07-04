Rails.application.routes.draw do
  get "login", to: redirect("/auth/google_oauth2"), as: "login"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  delete "logout", to: "sessions#destroy", as: "logout"

  resources :posts do
    resources :comments
  end

  root "home#index"
end
