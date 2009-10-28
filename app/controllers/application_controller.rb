# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  USERNAME, PASSWORD = "#brak", "afwas"
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :authenticate
  
  private
    def authenticate
      authenticate_or_request_with_http_basic("Wachtwoord? Vraag de bot maar, !admin") do |username, password|
        (Rails.env.development?) || (username == USERNAME && password == PASSWORD)
      end
    end
    
end
