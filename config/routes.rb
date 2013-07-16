SampleApp::Application.routes.draw do

  devise_for :users

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'static_pages#home'

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  # Static Pages
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
end
