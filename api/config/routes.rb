Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'
  resources :test
  match '*path' => 'options_request#preflight', via: :options

  namespace :api, { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth"
    end

    resources :instructors, only: [:index, :show, :create]

    resources :boards, only: [:index, :new, :show, :create] do
      member do
        post :apply
      end
    end

    resources :users do
      collection do
        get :mypage
        get :profile
      end
    end

    resources :reserves, only: [:index, :create]

    resources :message_rooms, only: [:index, :show, :create] do
      resources :messages, only: [:create]
    end
  end
end
