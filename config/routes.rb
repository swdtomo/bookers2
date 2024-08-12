Rails.application.routes.draw do

  devise_for :users
   root to: "home#top"
  get 'home/about', to: 'home#about',as: 'about'


  resources :books
  resources :users #userの後ろから　→　, only: [:show, :edit]を追加？
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
