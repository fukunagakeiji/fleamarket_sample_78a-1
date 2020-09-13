Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    # itemsのidを取得するためにネストでpurchaseを記載(idがつくためmemberで)
    collection do
      get "purchase"
    end
  end
end
