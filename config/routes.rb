Rails.application.routes.draw do
  root to: 'lists#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i[new show create] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: :destroy
end
