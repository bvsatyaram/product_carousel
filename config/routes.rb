Rails.application.routes.draw do
  get '/carousel/preview', to: 'carousel#preview', as: 'preview'
  get '/carousel/configure', to: 'carousel#configure', as: 'configure'

  resources :shopify_products, only: [:index]
  resources :carousel_items, only: [:index]
  root :to => 'carousel#preview'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
