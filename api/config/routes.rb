Rails.application.routes.draw do
  match '*path' => 'options_request#preflight', via: :options

  namespace :api, { format: 'json' } do
    resources :boards, only: [:index, :create]
  end
end
