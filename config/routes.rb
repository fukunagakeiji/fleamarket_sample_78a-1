Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    # itemsのidを取得するためにネストでpurchaseを記載(idがつくためmemberで)
    member do
      post "purchase"
    end
  end
end
