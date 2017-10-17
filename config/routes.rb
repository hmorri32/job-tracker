Rails.application.routes.draw do
  root :to => 'companies#index'

  resources :companies do
    resources :jobs
    resources :contacts
  end

  resources :jobs, :only => []  do
    resources :comments, :only => [:create]
  end

  resources :categories
end
