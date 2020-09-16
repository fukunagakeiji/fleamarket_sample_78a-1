Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    # itemsのidを取得するためにネストでpurchase,listingを記載(idがつくためmemberで)後でmemberに変更
    collection do
      get "purchase"
      get "listing"
    end
  end
end
