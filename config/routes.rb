Nowsta::Application.routes.draw do
  resources :people
  resources :events

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end