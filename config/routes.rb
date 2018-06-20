Rails.application.routes.draw do
  root :to => 'layouts#index'

  devise_for :users

  get 'mementos', to: 'mementos#all', as: :mementos

  resources :collections do
    resources :mementos
    patch 'invite_user' => 'collections#invite'
  end

  resources :users do
    resources :collections
  end

  resources :invites
end
