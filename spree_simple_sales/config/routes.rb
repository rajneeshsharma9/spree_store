Spree::Core::Engine.add_routes do
  # Add your extension routes here
  get "/sale" => "home#sale"
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      # Our new route goes here!
      resources :sales, only: [:index]
    end
  end
end
