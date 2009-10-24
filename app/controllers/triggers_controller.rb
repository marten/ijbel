class TriggersController < ApplicationController

  before_filter :find_factoid
  
  def index
    @triggers = @factoid.triggers.paginate(:page => params[:page], :order => "value ASC", :include => :responses)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @triggers }
    end
  end

  def show
    @trigger = @factoid.triggers.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trigger }
    end
  end

  def new
    @trigger = @factoid.triggers.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trigger }
    end
  end

  def edit
    @trigger = @factoid.triggers.find(params[:id])
  end

  def create
    @trigger = @factoid.triggers.build(params[:trigger])

    respond_to do |format|
      if @trigger.save
        flash[:notice] = 'Trigger was successfully created.'
        format.html { redirect_to(factoid_path(@factoid)) }
        format.xml  { render :xml => @trigger, :status => :created, :location => @trigger }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trigger.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @trigger = @factoid.triggers.find(params[:id])

    respond_to do |format|
      if @trigger.update_attributes(params[:trigger])
        flash[:notice] = 'Trigger was successfully updated.'
        format.html { redirect_to(@trigger) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trigger.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @trigger = @factoid.triggers.find(params[:id])
    @trigger.destroy

    flash[:notice] = "Trigger \`\`#{@trigger.value}'' destroyed."

    respond_to do |format|
      format.html { redirect_to(factoid_url(@factoid)) }
      format.xml  { head :ok }
    end
  end
  
  protected
    def find_factoid
      @factoid = Factoid.find(params[:factoid_id])
    end
end
