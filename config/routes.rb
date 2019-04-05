Rails.application.routes.draw do
  resources :users

  resources :members do
    collection do
      get :contact
      post :to_send
    end
  end
end
