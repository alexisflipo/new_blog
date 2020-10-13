Rails.application.routes.draw do
  devise_for :users

  resources :articles do
    resources :comments
  end
  get 'notifications.json', to: "notifications#index"
  post 'notifications/mark_as_read', to: "notifications#mark_as_read"
  root to: 'articles#index'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
