Rails.application.routes.draw do

  get '/sites', to: "sites#index"
  root to: 'front#index'
end
