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
  
  def new
    @factoid = Factoid.new
    @factoid.triggers.build
    @factoid.responses.build
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
  
  def create
    @factoid = Factoid.new(params[:factoid])
    
    if @factoid.save
      respond_to do |format|
        format.html { redirect_to @factoid }
        format.xml  { render :xml => @factoid.to_xml(:include => [:triggers, :responses]) }
      end
    else
      respond_to do |format|
        format.html { render :action => :new }
        format.xml  { render :xml => @factoid.errors.to_xml, :status => :unprocessable_entity }
      end
    end
  end
  
  def delete
    @factoid = Factoid.find(params[:id])

    case request.method
    when :get
      render
    when :post
      if not params[:destination].blank?
        @destination = Factoid.find(params[:destination])
        @destination.triggers  << @factoid.triggers
        @destination.responses << @factoid.responses
      end
      
      @factoid.destroy
      flash[:notice] = "Factoid #{@factoid.id} destroyed."
      
      if not params[:destination].blank?
        redirect_to @destination
      else
        redirect_to factoids_path
      end
    end
  end
  
end