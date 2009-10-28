class ResponsesController < ApplicationController
  
  before_filter :find_factoid, :only => [:index, :show, :new, :edit, :create, :update, :destroy]
  
  def index
    @responses = @factoid.responses.paginate(:page => params[:page], :order => 'value ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @responses }
    end
  end

  def show
    @response = @factoid.responses.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @response }
    end
  end

  def new
    @response = @factoid.responses.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @response }
    end
  end

  # GET /responses/1/edit
  def edit
    @response = @factoid.responses.find(params[:id])
  end

  def create
    @response = @factoid.responses.build(params[:response])

    respond_to do |format|
      if @response.save
        flash[:notice] = 'Response was successfully created.'
        format.html { redirect_to(factoid_path(@factoid)) }
        format.xml  { render :xml => @response, :status => :created, :location => @response }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @response.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @response = @factoid.responses.find(params[:id])

    respond_to do |format|
      if @response.update_attributes(params[:response])
        flash[:notice] = 'Response was successfully updated.'
        format.html { redirect_to(factoid_path(@factoid)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @response.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @response = @factoid.responses.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to(factoid_url(@factoid)) }
      format.xml  { head :ok }
    end
  end

  def random
    @response = Response.find(:first, :order => "RAND()")
    render :action => :show
  end
  
  def inc_karma
    Response.increment_counter(:karma, params[:id])
    redirect_to(Response.find(params[:id], :include => :factoid).factoid)
  end
  
  def dec_karma
    Response.decrement_counter(:karma, params[:id])
    redirect_to(Response.find(params[:id], :include => :factoid).factoid)
  end
  
  protected
    def find_factoid
      @factoid = Factoid.find(params[:factoid_id])
    end

end
