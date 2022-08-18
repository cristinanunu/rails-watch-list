Rails.application.routes.draw do
  get 'bookmarks/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, only: [ :index, :new, :show, :create ] do
    member do
      get :bookmarks
    end
  end
end
