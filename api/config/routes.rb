Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'
  resources :test
  match '*path' => 'options_request#preflight', via: :options

  namespace :api, { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth"
    end

    resources :boards, only: [:index, :new, :show, :create]

    resources :users do
      collection do
        get :mypage
        get :profile
      end
    end
  end
end
