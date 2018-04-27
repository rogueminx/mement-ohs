Rails.application.routes.draw do
  root :to => 'layouts#index'

  devise_for :users

  resources :recipients do
    resources :mementos
  end
end
