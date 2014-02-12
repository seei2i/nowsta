Nowsta::Application.routes.draw do
  authenticated :user do
    devise_scope :user do
      root to: "home#inside", :as => "profile"
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "home#index", :as => "unauthenticated"
    end
  end

  resources :jobs
  resources :people
  resources :events
  devise_for :users, :controllers => {:registrations => "registrations", :users => "users"}
  
  
  resources :users

  match '/:id' => "shortener/shortened_urls#show", via: [:get, :post]

end