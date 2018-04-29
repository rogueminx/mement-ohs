Rails.application.routes.draw do
  root :to => 'layouts#index'

  devise_for :users

  get 'mementos', to: 'mementos#all', as: :mementos

  resources :recipients do
    resources :mementos
  end

  resources :users do
    resources :recipients
  end
end
