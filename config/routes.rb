Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :home, :only => [ :index ]

  resources :users, :only => [ :index, :show ] do
    resources :quests, :except => [ :show ]
  end

  resources :quests do
    resources :missions, :except => [ :index ]
  end
end
