Rails.application.routes.draw do

    namespace :api do
      get 'client/all'
      get 'parkings/all'
      get 'tariffs/all'
      get 'tickets/all'
      get 'vehicles/all'
  resources :tariffs, only: %i[index create update show destroy] do
  end
  resources :tickets, only: %i[index create update show destroy] do

  end
  resources :vehicles, only: %i[index create update show destroy] do

  end
  resources :clients, only: %i[index create update show destroy] do

  end
  resources :parkings, only: %i[index create update show destroy] do
end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
