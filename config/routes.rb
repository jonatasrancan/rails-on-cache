Rails.application.routes.draw do
  resources :comments
  resources :books do
    member do
      get :etag_show
      get :fragment_cache_show
      get :action_cache_show
      get :page_cache_show
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
