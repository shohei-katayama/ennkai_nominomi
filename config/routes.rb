Rails.application.routes.draw do
  
  namespace :public do
    get 'reservations/index'
    get 'reservations/show'
  end
  namespace :admin do
    get 'reservation/index'
    get 'reservation/show'
  end
  namespace :admin do
    get 'genres/new'
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'store/new'
    get 'store/index'
    get 'store/show'
    get 'store/edit'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    get 'home/top'
    get 'home/about'
  end
  namespace :public do
    get 'favorites/index'
  end
  namespace :public do
    get 'store/show'
    get 'store/new'
    get 'store/index'
  end
  namespace :public do
    get 'customer/new'
    get 'customer/edit'
    get 'customer/show'
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
