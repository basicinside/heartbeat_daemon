class CrewsController < ApplicationController
  # GET /crews
  # GET /crews.xml
  def index
    @crews = Crew.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @crews }
    end
  end

  # GET /crews/1
  # GET /crews/1.xml
  def show
    @crew = Crew.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @crew }
    end
  end

  # GET /crews/new
  # GET /crews/new.xml
  def new
    @crew = Crew.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @crew }
    end
  end

  # GET /crews/1/edit
  def edit
    @crew = Crew.find(params[:id])
  end

  # POST /crews
  # POST /crews.xml
  def create
    @crew = Crew.new(params[:crew])

    respond_to do |format|
      if @crew.save
        flash[:notice] = 'Crew was successfully created.'
        format.html { redirect_to(@crew) }
        format.xml  { render :xml => @crew, :status => :created, :location => @crew }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @crew.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crews/1
  # PUT /crews/1.xml
  def update
    @crew = Crew.find(params[:id])

    respond_to do |format|
      if @crew.update_attributes(params[:crew])
        flash[:notice] = 'Crew was successfully updated.'
        format.html { redirect_to(@crew) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @crew.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crews/1
  # DELETE /crews/1.xml
  def destroy
    @crew = Crew.find(params[:id])
    @crew.destroy

    respond_to do |format|
      format.html { redirect_to(crews_url) }
      format.xml  { head :ok }
    end
  end
end
