Rails.application.routes.draw do
  resources :pimps do
    resource :like, module: :pimps
  end

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }


  root 'pages#index'

end