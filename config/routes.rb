Rails.application.routes.draw do

  root to: 'landing#index'
  get 'query' => 'query#index'

end
