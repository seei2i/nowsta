Nowsta::Application.routes.draw do
  resources :people
  resources :events
  devise_for :users, :controllers => {:registrations => "registrations", :users => "users"}
  
  root :to => "home#index"
  resources :users

  match '/:id' => "shortener/shortened_urls#show", via: [:get, :post]

end