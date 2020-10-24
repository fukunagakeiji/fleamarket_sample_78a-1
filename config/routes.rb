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
  resources :items, only: [:index, :new, :create, :edit, :update] do
    # itemsのidを取得するためにネストでpurchaseを記載(idがつくためmemberで)後でmemberに変更
    collection do
      get "category"
      get "purchase"
    end
  end
end
