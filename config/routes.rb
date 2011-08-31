Nerdgem::Application.routes.draw do
  resources :tutorials
  resources :welcome
  resources :ruby_gems
  devise_for :users

  match 'preview' => 'previews#preview', :as => :preview, :via => :get
  root :to => "tutorials#index"
end
