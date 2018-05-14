Rails.application.routes.draw do
  root :to => 'layouts#index'

  devise_for :users 

  get 'mementos', to: 'mementos#all', as: :mementos

  resources :collections do
    resources :mementos
  end

  resources :invites

  resources :users do
    resources :collections
  end
end
