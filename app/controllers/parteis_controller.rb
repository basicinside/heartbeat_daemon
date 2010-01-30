class ParteisController < ApplicationController
  # GET /parteis
  # GET /parteis.xml
  def index
    @parteien = Partei.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parteien }
    end
  end

  # GET /parteis/1
  # GET /parteis/1.xml
  def show
    @partei = Partei.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partei }
    end
  end

  # GET /parteis/new
  # GET /parteis/new.xml
  def new
    @partei = Partei.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partei }
    end
  end

  # GET /parteis/1/edit
  def edit
    @partei = Partei.find(params[:id])
  end

  # POST /parteis
  # POST /parteis.xml
  def create
    @partei = Partei.new(params[:partei])

    respond_to do |format|
      if @partei.save
        flash[:notice] = 'Partei was successfully created.'
        format.html { redirect_to(@partei) }
        format.xml  { render :xml => @partei, :status => :created, :location => @partei }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partei.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parteis/1
  # PUT /parteis/1.xml
  def update
    @partei = Partei.find(params[:id])

    respond_to do |format|
      if @partei.update_attributes(params[:partei])
        flash[:notice] = 'Partei was successfully updated.'
        format.html { redirect_to(@partei) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partei.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parteis/1
  # DELETE /parteis/1.xml
  def destroy
    @partei = Partei.find(params[:id])
    @partei.destroy

    respond_to do |format|
      format.html { redirect_to(parteis_url) }
      format.xml  { head :ok }
    end
  end
end
