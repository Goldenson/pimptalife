Rails.application.routes.draw do
  resources :pimps do
    resource :like, module: :pimps
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'pages#index'

end