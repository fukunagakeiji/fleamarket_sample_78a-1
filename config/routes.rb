Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'contact_informations', to: 'users/registrations#new_contact_information'
    post 'contact_informations', to: 'users/registrations#create_contact_information'
  end
  resources :users, only: [:show]
  root 'items#index'
  resources :items do
    # itemsのidを取得するためにネストでpurchaseを記載(idがつくためmemberで)後でmemberに変更
    collection do
      get "category"
    end
    member do
      get "purchase", to: 'items#purchase'
      post "pay", to: 'items#pay'
    end
  end
  resources :creditcards, only: [:new, :create, :destroy]
end
