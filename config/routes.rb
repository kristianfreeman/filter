Filter::Application.routes.draw do
  root "pages#home"
  resources :podcasts, except: [:index]
  resources :episodes
  resources :subscriptions
  resources :users, only: [:edit, :update]
  get '/help', to: "pages#help"
  get "/utilities/hello"
  get "/auth/:provider/:callback", to: "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
  get "/my_podcast", to: "podcasts#show"
  post "/users/remove_card", to: "subscriptions#remove_card", as: "remove_card"
  post "/subscriptions/reactivate", to: "subscriptions#reactivate", as: "reactivate_subscription"
  post "episodes/blacklist", to: "episodes#blacklist", as: "blacklist_episode"
  mount Resque::Server, :at => "/resque"
end
