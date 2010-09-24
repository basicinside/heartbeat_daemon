class PartiesController < ApplicationController
	filter_access_to :all
  # GET /parties
  # GET /parties.xml
  def index
    @partyen = Party.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partyen }
    end
  end

  # GET /parties/1
  # GET /parties/1.xml
  def show
    @party = Party.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @party }
    end
  end

  # GET /parties/new
  # GET /parties/new.xml
  def new
    @party = Party.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @party }
    end
  end

  # GET /parties/1/edit
  def edit
    @party = Party.find(params[:id])
  end

  # POST /parties
  # POST /parties.xml
  def create
    @party = Party.new(params[:party])

    respond_to do |format|
      if @party.save
        format.html { redirect_to("/users/current/edit", :notice => "Die Partei wurde erfolgreich angelegt.") }
        format.xml  { render :xml => @party, :status => :created, :location => @party }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parties/1
  # PUT /parties/1.xml
  def update
    @party = Party.find(params[:id])

    respond_to do |format|
      if @party.update_attributes(params[:party])
        flash[:notice] = 'Party was successfully updated.'
        format.html { redirect_to(@party) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.xml
  def destroy
    @party = Party.find(params[:id])
    @party.destroy

    respond_to do |format|
      format.html { redirect_to(parties_url) }
      format.xml  { head :ok }
    end
  end
end
