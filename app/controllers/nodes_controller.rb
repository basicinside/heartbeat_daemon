class NodesController < ApplicationController
  # GET /nodes
  # GET /nodes.xml
  def index
    @nodes = Node.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
    end
  end

  # GET /nodes/1
  # GET /nodes/1.xml
  def show
    @node = Node.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @node }
    end
  end

 	#function triggered by heartbeat script (node side)
  def status
  	 if !params[:node_id] && !params[:rev]
  	 	return
  	 end
  
  	#check for node
  	@node = Node.find(:first, :conditions => ['node_id = ?', params[:node_id]]) 
  	
  	if !@node 
  		#new node creation
  		@node = Node.new
  		
  		#params saved for update
  		@node.node_id = params[:node_id]
  		@node.rev = params[:rev]
  		
  		#params saved for informations
  		if params[:name] && params[:lat] && params[:lon] && params[:crew] && params[:lv] && params[:partei]
  			@node.name = params[:name]
  			@node.lat = params[:lat]
  			@node.lon = params[:lon]
  		
  			#create crew, if necessary
  			if !(crew = Crew.find(:first, :conditions => ['name = ?', params[:crew].capitalize]))
   				crew = Crew.new
  				crew.name = params[:crew].capitalize
  				crew.save
  			end
  			@node.crew_id = crew.id
  		
  			#create lv, if necessary
  			if !(lv = Landesverband.find(:first, :conditions => ['name = ?', params[:lv].capitalize]))
   				lv = Landesverband.new
  				lv.name = params[:lv].capitalize
  				lv.save
  			end	
  			@node.landesverband_id = lv.id
  			@node.partei_id = Partei.find(:first, :conditions => ['id = ?', params[:partei]])
  		
  			#params saved for highscore
				if params[:neighboors] && params[:clients]
					@node.neighboors_count = params[:neighboors]
 					@node.clients_count = params[:clients]
 				end
 			end
 			
 			#save node entry
 			@node.save
  	else
  		#update node
  		
  		#params saved for update
  		if params[:rev] 
  			@node.rev = params[:rev]
  			
  			#params saved for informations
  			if params[:name] && params[:lat] && params[:lon] && params[:crew] && params[:lv] && params[:partei]
  				@node.name = params[:name]
  				@node.lat = params[:lat]
  				@node.lon = params[:lon]
					#create crew, if necessary
  				if !(crew = Crew.find(:first, :conditions => ['name = ?', params[:crew].capitalize]))
   					crew = Crew.new
  					crew.name = params[:crew].capitalize
  					crew.save
  				end
  				@node.crew_id = crew.id
  		
  				#create lv, if necessary
  				if !(lv = Landesverband.find(:first, :conditions => ['name = ?', params[:lv].capitalize]))
   					lv = Landesverband.new
  					lv.name = params[:lv].capitalize
  					lv.save
  				end	
  				@node.landesverband_id = lv.id
  				@node.partei_id = Partei.find(:first, :conditions => ['id = ?', params[:partei]])
				
				
					#params saved for highscore
					if params[:neighboors] && params[:clients]
 						@node.neighboors_count = @node.neighboors_count < params[:neighboors] ? params[:neighboors] : @node.neighboors_count
 						@node.clients_count = @node.clients_count < params[:clients] ? params[:clients] : @node.clients_count
 					end
 				end
 			end
  	end
  	respond_to do |format|
      if @node.save
        flash[:notice] = 'Node was successfully created.'
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @node, :status => :created, :location => @node }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @node.errors, :status => :unprocessable_entity }
      end
    end
  end
  		

  # DELETE /nodes/1
  # DELETE /nodes/1.xml
  def destroy
    @node = Node.find(params[:id])
    @node.destroy

    respond_to do |format|
      format.html { redirect_to(nodes_url) }
      format.xml  { head :ok }
    end
  end
end
