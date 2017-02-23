Rails.application.routes.draw do
  resources :events
  resources :users
  resources :requests
  put "requests/accept/:id", to: "requests#update_accept"
  put "requests/reject/:id", to: "requests#update_reject"
  post "register", to: "authentications#register"
  post "login", to: "authentications#login"
end
