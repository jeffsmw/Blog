Rails.application.routes.draw do

  get '/' => 'home#index', as: :home
  get '/about' => 'home#about'

  resources :blog
end
