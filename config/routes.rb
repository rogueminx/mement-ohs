Rails.application.routes.draw do
  root :to => 'layouts#index'

  devise_for :users

  get 'mementos', to: 'mementos#all', as: :mementos
  get 'send_mail', to: 'UserMailer#share_memento_email(user,recipient, url)', as: :send_memento_mail

  resources :recipients do
    resources :mementos
  end

  resources :users do
    resources :recipients
  end
end
