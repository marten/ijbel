ActionController::Routing::Routes.draw do |map|
  map.resources :factoids, :collection => {:search => :get} do |factoid|
    factoid.resources :triggers 
    factoid.resources :responses
  end
  
  map.resources :responses, :only => :none, :collection => {:random => :get}
end
