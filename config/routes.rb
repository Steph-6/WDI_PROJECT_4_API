Rails.application.routes.draw do
  resources :slots
  resources :events
  resources :users
  resources :requests

  post "register", to: "authentications#register"
  post "login", to: "authentications#login"
end
