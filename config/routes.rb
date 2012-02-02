Nerdgem::Application.routes.draw do
  resources :authentications

  resources :tutorials do
    collection do
      get 'find'
    end
    member do
      put 'add_point'
    end
  end
  resources :welcome do
  end
  resources :ruby_gems
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :users
  

  match '/auth/:provider/callback' => 'authentications#create'
  match 'preview' => 'previews#preview', :as => :preview, :via => :post
  match 'about' => 'welcome#about', :as => :about
  match 'hello' => 'welcome#hello', :as => :hello
  root :to => "tutorials#index"
end
