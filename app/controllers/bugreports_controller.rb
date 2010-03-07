class BugreportsController < ApplicationController
  # GET /bugreports
  # GET /bugreports.xml
  def index
    @bugreports = Bugreport.all

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
    @bugreport = Bugreport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bugreport }
    end
  end

  # GET /bugreports/1/edit
  def edit
    @bugreport = Bugreport.find(params[:id])
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

  # PUT /bugreports/1
  # PUT /bugreports/1.xml
  def update
    @bugreport = Bugreport.find(params[:id])

    respond_to do |format|
      if @bugreport.update_attributes(params[:bugreport])
        flash[:notice] = 'Bugreport was successfully updated.'
        format.html { redirect_to(@bugreport) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bugreport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bugreports/1
  # DELETE /bugreports/1.xml
  def destroy
    @bugreport = Bugreport.find(params[:id])
    @bugreport.destroy

    respond_to do |format|
      format.html { redirect_to(bugreports_url) }
      format.xml  { head :ok }
    end
  end
end
