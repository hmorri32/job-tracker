Rails.application.routes.draw do
  root :to => 'dashboard#index'

  resources :companies do
    resources :jobs
    resources :contacts
  end

  resources :jobs, :only => [:index]  do
    resources :comments, :only => [:create]
  end

  resources :dashboard, :only => [:index]
  resources :categories
end

# custom routes
# namespace routes