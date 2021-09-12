Rails.application.routes.draw do
  get 'file_management/index'
  get 'conversion/index'
  post 'conversion/index'
  devise_for :admins, controllers: { registrations: 'registrations' }
  root to: 'conversion#index'

  resources :file_management do
    collection do
      post :delete_from_storage
    end
  end
end
