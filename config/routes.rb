Rails.application.routes.draw do
  post 'users/update_bookmarks_order', to: 'users#update_bookmarks_order' 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    member do
      get 'bookmark'
      patch 'update_canvas'
    end
  end
    resources :tweets do
      collection do
        get 'top'
      end

      member do
      post 'set_custom_time'
      end
      
      resources :likes, only: [:create, :destroy]
    end
  root 'tweets#top'
  end

  