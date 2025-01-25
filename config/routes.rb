Rails.application.routes.draw do
  
  post 'users/update_bookmarks_order', to: 'users#update_bookmarks_order' 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    member do
      get 'bookmark'
      patch 'update_canvas'
      post :remove_stamp
    end
    post 'stamp', on: :member
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
    resources :posts
    
    resources :songs do
      collection do
        get "search"
      end
      member do
        get "artist"
        get "album"
      end
    end
    resources :songs do
      collection do
        get "search"
      end
      member do
        get "artist"
        get "album"
      end
    end
        
  root 'hello#index'
  end

  