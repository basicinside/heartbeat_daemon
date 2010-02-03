class NodesController < ApplicationController
	map_layer :node, :text => :popup_info || :node_id, :lat => :lat, :lon => :lon, :id => :id

  # GET /nodes
  # GET /nodes.xml
  def index
    @nodes = Node.find(:all,  :select => "nodes.*, SUM(scores.score) AS score",
                :joins => :scores, :group => 'nodes.id' )

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
      format.kml  { render :xml => @node }
    end
  end

 	#function triggered by heartbeat script (node side)
  def status
  	 if !params[:node_id] || !params[:rev] || !(/^[0-9a-f]{32}$/.match(params[:node_id]))
  	 	flash[:notice] = 'Update fehlgeschlagen<br />Interner Fehler: Datenbank nicht erreichbar.<br /> Bitte versuchen Sie es später noch einmal.'
      redirect_to :action => "index"
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
  		if params[:name] && params[:lat] && params[:lon] && params[:crew] && params[:lv]
  			@node.name = params[:name]
  			@node.lat = params[:lat]
  			@node.lon = params[:lon]
				
				if !params[:land] 
					params[:land] = 'Deutschland'
				end
				
				if !params[:partei] || params[:partei] == 1
					params[:partei] = 'Piratenpartei Deutschland'
				end
				
	 			#create land, if necessary
  			if !(land = Land.find(:first, :conditions => ['name = ?', params[:land].capitalize]))
   				land = Land.new
  				land.name = params[:land].capitalize
  				land.save
  			end
  			
  			#create lv, if necessary
  			if !(partei = Partei.find(:first, :conditions => ['name = ? AND land_id = ?', params[:partei].capitalize, land.id]))
   				partei = Partei.new
  				partei.name = params[:partei].capitalize
  				partei.land_id = land
  				partei.save
  			end
  		
	 			#create lv, if necessary
  			if !(lv = Landesverband.find(:first, :conditions => ['name = ? AND partei_id = ?', params[:lv].capitalize, partei.id]))
   				lv = Landesverband.new
  				lv.name = params[:lv].capitalize
  				lv.partei_id = partei.id
  				lv.save
  			end
  			
  			#create crew, if necessary
  			if !(crew = Crew.find(:first, :conditions => ['name = ? AND landesverband_id = ?', params[:crew].capitalize, lv.id]))
   				crew = Crew.new
  				crew.name = params[:crew].capitalize
  				crew.landesverband_id = lv.id
  				crew.save
  			end
  			@node.crew_id = crew.id
  		
  			#params saved for highscore
				if params[:neighboors] && params[:clients]
					@node.neighboors_count = params[:neighboors]
 					@node.clients_count = params[:clients]
 				end
 			else
 				@node.name = ""
 				@node.lat = 0
 				@node.lon = 0
 			end
 			
 			#save node entry
 			@node.last_seen = Time.now
 			@node.save
 			
 			#add initial score
 			initial_score = Score.new
 			initial_score.variant = 0
 			initial_score.score = 100
 			initial_score.node_id = @node.id
 			initial_score.save
 			puts "added initial score"
  	else
  		#update node
  		
  		#params saved for update
  		if params[:rev] 
  			@node.rev = params[:rev]
  			
  			#add heartbeat score
 				puts @node.last_seen
				if @node.last_seen + 1.day < Time.now
 					heartbeat_score = Score.new
 					heartbeat_score.variant = 1
 					heartbeat_score.score = 10
 					heartbeat_score.node_id = @node.id
 					heartbeat_score.save
 					puts "added heartbeat score"
 				end
  			
  			#params saved for informations
  			if params[:name] && params[:lat] && params[:lon] && params[:crew] && params[:lv]
  				@node.name = params[:name]
  				@node.lat = params[:lat]
  				@node.lon = params[:lon]
  				
				if !params[:land] 
					params[:land] = 'Deutschland'
				end
				
				if !params[:partei] || params[:partei] == 1
					params[:partei] = 'Piratenpartei Deutschland'
				end
				
	 			#create land, if necessary
  			if !(land = Land.find(:first, :conditions => ['name = ?', params[:land].capitalize]))
   				land = Land.new
  				land.name = params[:land].capitalize
  				land.save
  			end
  			
  			#create lv, if necessary
  			if !(partei = Partei.find(:first, :conditions => ['name = ? AND land_id = ?', params[:partei].capitalize, land.id]))
   				partei = Partei.new
  				partei.name = params[:partei].capitalize
  				partei.land_id = land
  				partei.save
  			end
  		
	 			#create lv, if necessary
  			if !(lv = Landesverband.find(:first, :conditions => ['name = ? AND partei_id = ?', params[:lv].capitalize, partei.id]))
   				lv = Landesverband.new
  				lv.name = params[:lv].capitalize
  				lv.partei_id = partei.id
  				lv.save
  			end
  			
  			#create crew, if necessary
  			if !(crew = Crew.find(:first, :conditions => ['name = ? AND landesverband_id = ?', params[:crew].capitalize, lv.id]))
   				crew = Crew.new
  				crew.name = params[:crew].capitalize
  				crew.landesverband_id = lv.id
  				crew.save
  			end
  			@node.crew_id = crew.id 						
					#params saved for highscore
					if params[:neighboors] && params[:clients]
 						@node.neighboors_count = @node.neighboors_count.to_f < params[:neighboors].to_f ? params[:neighboors].to_f : @node.neighboors_count.to_f
 						@node.clients_count = @node.clients_count.to_f < params[:clients].to_f ? params[:clients].to_f : @node.clients_count.to_f
 						
 						#add client score
 						if @node.last_seen + 1.day < Time.now && scr = (params[:clients].to_i/3).floor > 0
 							client_score = Score.new
 							client_score.variant = 2
 							client_score.score = scr
 							client_score.node_id = @node.id
 							client_score.save
 							puts "added client score"
 						end
 						
 						#add neighboor score
 						if @node.last_seen + 1.day < Time.now && scr = (params[:neighboors].to_i/2).floor > 0
 							neighboor_score = Score.new
 							neighboor_score.variant = 3
 							neighboor_score.score = scr
 							neighboor_score.node_id = @node.id
 							neighboor_score.save
 							puts "added neighboor score"
 						end
 					end
 				else
 					@node.name = ""
 					@node.lat = 0
 					@node.lon = 0
 				end
 			end
  	end
  	respond_to do |format|
  		@node.last_seen = Time.now
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
