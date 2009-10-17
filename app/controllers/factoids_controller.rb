class FactoidsController < ApplicationController
  def index
    @factoids = Factoid.paginate(:page => params[:page], :include => [:triggers, :responses])
  end
  
  def show
    @factoid = Factoid.find(params[:id])
  end
  
end
