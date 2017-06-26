Rails.application.routes.draw do
  namespace :admin do
    get '/carousel/preview', to: 'carousel#preview', as: 'preview'
    get '/carousel/configure', to: 'carousel#configure', as: 'configure'

    resources :shopify_products, only: [:index]
    resources :carousel_items, only: [:index, :create, :destroy]
  end

  resources :slides, only: [:index]

  root :to => 'admin/carousel#preview'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
