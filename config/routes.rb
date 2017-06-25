Rails.application.routes.draw do
  resources :carousel_items, only: [:index]
  root :to => 'carousel_items#index'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
