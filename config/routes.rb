Rails.application.routes.draw do
  root :to => 'layouts#index'

  devise_for :users

  get 'users/:id/mementos', to: 'users#memento', as: :users_mementos
  post 'recipients/:id/new_memento', to: 'mementos#new_memento', as: :new_memento


  resources :recipients do
    resources :mementos
  end

  resources :users do
    resources :recipients
  end
end
