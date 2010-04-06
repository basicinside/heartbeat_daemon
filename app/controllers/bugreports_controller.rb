class BugreportsController < ApplicationController
  # GET /bugreports
  # GET /bugreports.xml

  skip_before_filter :verify_authenticity_token
  
   #verify :method => :post, :only => :new, :add_headers => {‘Allow’ => ‘POST’}

  def index
    @bugreports = Bugreport.find(:all, :order => 'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bugreports }
    end
  end

  # GET /bugreports/1
  # GET /bugreports/1.xml
  def show
    @bugreport = Bugreport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bugreport }
    end
  end

  # GET /bugreports/new
  # GET /bugreports/new.xml
  def new
    @bugreport = Bugreport.new(params[:bugreport])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bugreport }
    end
  end


 

  # POST /bugreports
  # POST /bugreports.xml
  def create
    @bugreport = Bugreport.new(params[:bugreport])

    respond_to do |format|
      if @bugreport.save
        flash[:notice] = 'Bugreport was successfully created.'
        format.html { redirect_to(@bugreport) }
        format.xml  { render :xml => @bugreport, :status => :created, :location => @bugreport }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bugreport.errors, :status => :unprocessable_entity }
      end
    end
  end

end
