class FactoidsController < ApplicationController
  def index
    @factoids = Factoid.paginate(:order => "id DESC",
                                 :include => [:triggers, :responses],
                                 :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @factoids.to_xml(:include => [:triggers, :responses]) }
    end
  end
  
  def show
    @factoid = Factoid.find(params[:id])
  end
  
  def search
    if params[:q]
      triggers  = Trigger.all( :conditions => ["value LIKE ?", "%#{params[:q]}%"])
      responses = Response.all(:conditions => ["value LIKE ?", "%#{params[:q]}%"])
      @factoids = (triggers.map  {|t| t.factoid(:include => [:triggers, :responses]) } + 
                   responses.map {|r| r.factoid(:include => [:triggers, :responses]) }).uniq.paginate(params)
      render :action => :index
    end
  end
  
  def delete
    @factoid = Factoid.find(params[:id])

    case request.method
    when :get
      render
    when :post
      @destination = Factoid.find(params[:destination])
      @destination.triggers  << @factoid.triggers
      @destination.responses << @factoid.responses
      @factoid.destroy
      redirect_to @destination
    end
  end
  
end