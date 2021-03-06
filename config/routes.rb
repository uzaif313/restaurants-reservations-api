Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root "page#index"
  namespace :api do
    namespace :v1 do
      resources :reservations
      resources :restaurants  do
      	resources :reservations, only: :index
      end
    end
  end
  get '/docs', to: 'api_docs#index'
end
