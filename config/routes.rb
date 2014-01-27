Nowsta::Application.routes.draw do
  resources :people
  resources :events
  

  match '/:id' => "shortener/shortened_urls#show", via: [:get, :post]

  
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  root :to => "home#index"
end