Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :home, :only => [ :index ]

  resources :users, :only => [ :index, :show ] do
    resources :quests
  end

  resources :quests, :only => [ :show ] do
    resources :missions
  end

  resources :static_pages, :only => [ :index ]
  get 'resources', :to => 'static_pages#index'
end
