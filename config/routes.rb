Rails.application.routes.draw do
  root to: "pages#home"
  post "signups/update", to: "signups#update", as: :signup
  match "webhooks/person_changed", to: "webhooks#person_changed", via: :post
end
