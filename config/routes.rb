Imghub::Application.routes.draw do
  root to: 'images#index'
  resources :images, :defaults => {:format => 'html'}
end
