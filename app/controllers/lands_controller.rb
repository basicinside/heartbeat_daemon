class LandsController < ApplicationController
  # GET /lands
  # GET /lands.xml
  def index
    @lands = Land.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lands }
    end
  end

  # GET /lands/1
  # GET /lands/1.xml
  def show
    @land = Land.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @land }
    end
  end

  # GET /lands/new
  # GET /lands/new.xml
  def new
    @land = Land.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @land }
    end
  end

  # GET /lands/1/edit
  def edit
    @land = Land.find(params[:id])
  end

  # POST /lands
  # POST /lands.xml
  def create
    @land = Land.new(params[:land])

    respond_to do |format|
      if @land.save
        flash[:notice] = 'Land was successfully created.'
        format.html { redirect_to(@land) }
        format.xml  { render :xml => @land, :status => :created, :location => @land }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @land.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lands/1
  # PUT /lands/1.xml
  def update
    @land = Land.find(params[:id])

    respond_to do |format|
      if @land.update_attributes(params[:land])
        flash[:notice] = 'Land was successfully updated.'
        format.html { redirect_to(@land) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @land.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lands/1
  # DELETE /lands/1.xml
  def destroy
    @land = Land.find(params[:id])
    @land.destroy

    respond_to do |format|
      format.html { redirect_to(lands_url) }
      format.xml  { head :ok }
    end
  end
end
