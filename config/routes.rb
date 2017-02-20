Rails.application.routes.draw do
  resources :events
  resources :users
  resources :requests
  
  post "register", to: "authentications#register"
  post "login", to: "authentications#login"
end
