Rails.application.routes.draw do
  root :to => 'messages#new'

  resources :messages, :only => [:index, :new, :create, :show]
  resources :contacts, :only => [:new, :create]
end
