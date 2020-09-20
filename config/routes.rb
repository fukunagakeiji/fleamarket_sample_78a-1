Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: [:index, :new, :create] do
    # itemsのidを取得するためにネストでpurchase,listingを記載(idがつくためmemberで)後でmemberに変更
    collection do
      get "purchase"
    end
  end
end
