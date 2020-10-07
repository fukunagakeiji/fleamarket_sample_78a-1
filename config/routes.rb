Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'contact_informations', to: 'users/registrations#new_contact_information'
    post 'contact_informations', to: 'users/registrations#create_contact_information'
  end
  root 'items#index'
  resources :items do
    # itemsのidを取得するためにネストでpurchase,listingを記載(idがつくためmemberで)後でmemberに変更
    collection do
      get "purchase"
      get "listing"
    end
  end
end
