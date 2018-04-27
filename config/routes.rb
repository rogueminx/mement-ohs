Rails.application.routes.draw do
  root :to => 'layouts#index'

  devise_for :users

  get 'users/:id/mementos', to: 'users#memento', as: :users_mementos

  resources :recipients do
    resources :mementos
  end

  resources :users do
    resources :recipients
  end
end
