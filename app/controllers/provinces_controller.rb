class ProvincesController < ApplicationController
  # GET /landesverbands
  # GET /landesverbands.xml
  def index
    @landesverbands = Landesverband.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @landesverbands }
    end
  end

  # GET /landesverbands/1
  # GET /landesverbands/1.xml
  def show
    @landesverband = Landesverband.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @landesverband }
    end
  end

  # GET /landesverbands/new
  # GET /landesverbands/new.xml
  def new
    @landesverband = Landesverband.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @landesverband }
    end
  end

  # GET /landesverbands/1/edit
  def edit
    @landesverband = Landesverband.find(params[:id])
  end

  # POST /landesverbands
  # POST /landesverbands.xml
  def create
    @landesverband = Landesverband.new(params[:landesverband])

    respond_to do |format|
      if @landesverband.save
        flash[:notice] = 'Landesverband was successfully created.'
        format.html { redirect_to(@landesverband) }
        format.xml  { render :xml => @landesverband, :status => :created, :location => @landesverband }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @landesverband.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /landesverbands/1
  # PUT /landesverbands/1.xml
  def update
    @landesverband = Landesverband.find(params[:id])

    respond_to do |format|
      if @landesverband.update_attributes(params[:landesverband])
        flash[:notice] = 'Landesverband was successfully updated.'
        format.html { redirect_to(@landesverband) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @landesverband.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /landesverbands/1
  # DELETE /landesverbands/1.xml
  def destroy
    @landesverband = Landesverband.find(params[:id])
    @landesverband.destroy

    respond_to do |format|
      format.html { redirect_to(landesverbands_url) }
      format.xml  { head :ok }
    end
  end
end
