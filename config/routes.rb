Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'contact_informations', to: 'users/registrations#new_contact_information'
    post 'contact_informations', to: 'users/registrations#create_contact_information'
  end
  root 'items#index'
  #resources ：users, only[:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
