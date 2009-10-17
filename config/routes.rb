ActionController::Routing::Routes.draw do |map|
  map.resources :responses

  map.resources :triggers
  map.resources :responses
end
