Rails.application.routes.draw do

  get '/' => 'home#index', as: :home
  get '/about' => 'home#about'
  resources :posts, shallow: true do
    resources :comments, only: [:create, :destroy]
  end
end
