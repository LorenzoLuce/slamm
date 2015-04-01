Rails.application.routes.draw do

  root to: 'landing#index'
  get 'query' => 'query#index'
  post 'show_file' => 'query#show_file'

end
