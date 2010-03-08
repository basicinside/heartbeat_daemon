class HardwaresController < ApplicationController
  # GET /hardwares
  # GET /hardwares.xml
  def index
    @hardwares = Hardware.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hardwares }
    end
  end

  # GET /hardwares/1
  # GET /hardwares/1.xml
  def show
    @hardware = Hardware.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hardware }
    end
  end

  # GET /hardwares/new
  # GET /hardwares/new.xml
  def new
    @hardware = Hardware.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hardware }
    end
  end

  # GET /hardwares/1/edit
  def edit
    @hardware = Hardware.find(params[:id])
  end

  # POST /hardwares
  # POST /hardwares.xml
  def create
    @hardware = Hardware.new(params[:hardware])

    respond_to do |format|
      if @hardware.save
        flash[:notice] = 'Hardware was successfully created.'
        format.html { redirect_to(@hardware) }
        format.xml  { render :xml => @hardware, :status => :created, :location => @hardware }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hardware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hardwares/1
  # PUT /hardwares/1.xml
  def update
    @hardware = Hardware.find(params[:id])

    respond_to do |format|
      if @hardware.update_attributes(params[:hardware])
        flash[:notice] = 'Hardware was successfully updated.'
        format.html { redirect_to(@hardware) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hardware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hardwares/1
  # DELETE /hardwares/1.xml
  def destroy
    @hardware = Hardware.find(params[:id])
    @hardware.destroy

    respond_to do |format|
      format.html { redirect_to(hardwares_url) }
      format.xml  { head :ok }
    end
  end
end
