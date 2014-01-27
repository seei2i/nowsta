Nowsta::Application.routes.draw do
  resources :people
  resources :events
  resources :users

  match '/:id' => "shortener/shortened_urls#show", via: [:get, :post]

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
end