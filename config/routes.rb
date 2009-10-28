ActionController::Routing::Routes.draw do |map|
  map.resources :factoids, :collection => {:search => :get},
                           :member => {:delete => [:get, :post]} do |factoid|
    factoid.resources :triggers 
    factoid.resources :responses, :member => {:inc_karma => :put, 
                                              :dec_karma => :put}
  end
  
  map.resources :responses, :only => :none, :collection => {:random => :get}

  map.resources :pages
  
  map.root :controller => :responses, :action => :random
end
