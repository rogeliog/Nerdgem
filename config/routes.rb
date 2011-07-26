Nerdgem::Application.routes.draw do
  resources :tutorials
  resources :welcome
  resources :ruby_gems

  devise_for :users

  root :to => "tutorials#index"
end
