Nerdgem::Application.routes.draw do
  resources :authentications

  resources :tutorials
  resources :welcome
  resources :ruby_gems
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :users
  

  match '/auth/:provider/callback' => 'authentications#create'
  match 'preview' => 'previews#preview', :as => :preview, :via => :post
  root :to => "tutorials#index"
end
