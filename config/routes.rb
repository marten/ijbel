ActionController::Routing::Routes.draw do |map|
  map.resources :factoids, :collection => {:search => :get},
                           :member => {:delete => [:get, :post]} do |factoid|
    factoid.resources :triggers 
    factoid.resources :responses
  end
  
  map.resources :responses, :only => :none, :collection => {:random => :get}
  
  map.root :controller => :responses, :action => :random
end
