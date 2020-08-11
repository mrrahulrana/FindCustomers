Rails.application.routes.draw do
  
  root to: "searches#index"

  get 'searches/index'
  post 'searches/search', to: 'searches#search', as: :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
