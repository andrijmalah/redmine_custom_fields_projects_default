# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
resources :projects do
  resources :custom_fields_defaults, only: [:create]
end
