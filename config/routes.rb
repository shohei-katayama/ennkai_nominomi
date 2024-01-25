Rails.application.routes.draw do

#管理者側
  namespace :admin do
    resources :reservations, only: [:index,:show,:update]
    resources :genres, only: [:new,:index,:edit,:create,:update]
    resources :stores, only: [:new,:index,:show,:edit,:create,:update,:destroy]
    #店舗の削除
    #delete '/stores/:id', to: 'stores#destroy', as: 'admin_store'
    resources :customers, only: [:index,:show,:edit,:update]
    root to: "homes#top"
  end

#ユーザー側
  scope module: :public do
    resources :reservations, only: [:index,:show]
    resources :stores, only: [:new,:index,:show] do
      resource :favorite, only: [:create, :destroy]
      resources :reservations, only: [:new,:create] do
      collection do
        get "confirm" => "reservations#confirm"
        patch "thanks" => "reservations#thanks"
      end
      end
    end
    get "favorites/index" => "favorites#index"
    resources :customers, only: [:new]
    get 'favorites/index'
    get "customers/infomation/edit" => "customers#edit"
    get "customers/my_page" => "customers#show"
    patch "customers/infomation" => "customers#update"
    root to: "homes#top"
    get "about" => "homes#about"
    get "/search", to: "searches#search"
  end

#管理者側
  devise_for :admins, controllers: {
    sessions: "admin/sessions"
  }

#ユーザー側
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
