class NodesController < ApplicationController
	require 'open-uri'
require 'digest/md5'
	filter_access_to :all
	map_layer :node, :text => :popup_info || :node_id, :lat => :lat || 0, :lon => :lon || 0, :id => :id
	use_google_charts

	def edit
		@node = Node.find(params[:id])
if @node.photos.first.nil?
    1.upto(3) { @node.photos.build }
  end
	end

  # GET /nodes
  # GET /nodes.xml
  def index
	last_seen = Date.today - 7.days
    @nodes = Node.find(:all, :conditions => ["nodes.name != '' AND last_seen > '#{last_seen}'"],  :select => "nodes.*, SUM(scores.score) AS score ",
                :joins => :scores, :group => 'nodes.id', :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @nodes }
    end
  end

	def register
		if params[:node_id]
			redirect_to "/nodes/register/#{params[:node_id]}"
			return
		end
	
		if params[:id] 
						if !current_user
							flash[:notice] = 'Bitte logge dich ein, um ein Gerät zu registrieren.'
							redirect_to root_url
						end

						if node = Node.find(:first, :conditions => ["node_id = ?", params[:id]])
							if node.user && node.user != current_user
								flash[:notice] = "Das Gerät ist bereits vn <a href='/users/show/#{node.user.id}'>#{node.user.username}</a> registriert. Bitte wende dich an den Administrator."
								redirect_to node
							else
								flash[:notice] = "Das Gerätist nun registriert af <a href='/users/sho/#{current_user.id}'>#{current_user.username}</a>."

								node.user = current_user
								node.save
								redirect_to node
							end
						else
							flash[:notice] = "Das Gerät wurde nicht gefunden."
							 redirect_to '/nodes/register'
						
						end
		else
			respond_to do |format|
      	format.html # index.html.erb
      	#format.xml  { render :xml => @nodes }
   	 	end
		end
	end

	def update
  params[:photo_ids] ||= []
  @node = Node.find(params[:id])
  unless params[:photo_ids].empty?
    Photo.destroy_pics(params[:id], params[:photo_ids])
  end
 
  respond_to do |format|
    if @node.update_attributes(params[:node])
      flash[:notice] = 'Node was successfully updated.'
      format.html { redirect_to(@node) }
      format.xml  { head :ok }
    else
      format.html { render :action => "edit" }
      format.xml  { render :xml => @node.errors, :status => :unprocessable_entity }
    end
  end
end
			

  # GET /nodes/1
  # GET /nodes/1.xml
  def show
    @node = Node.find(params[:id])

		#load minimap
    @map = MapLayers::Map.new("map", :displayProjection => OpenLayers::Projection.new("EPSG:4326"),
 :projection => OpenLayers::Projection.new("EPSG:4326")) do |map, page|

      page << map.add_layer(MapLayers::OSM_MAPNIK , :projection => OpenLayers::Projection.new("EPSG:4326"))

      page << map.add_layer(Layer::GeoRSS.new("Nodes", "/nodes/georss", { :projection => OpenLayers::Projection.new("EPSG:4326"),
       :icon => OpenLayers::Icon.new("/images/flag.png", OpenLayers::Size.new(20,20))}))

      lonlat =  OpenLayers::LonLat.new(@node.lon, @node.lat).transform(OpenLayers::Projection.new("EPSG:4326"), map.getProjectionObject())
      page << map.set_center(lonlat, 15 )
		end
		
		#neighbors and clients chart
		heartbeats = Heartbeat.find(:all, :conditions => ["node_id = ?", @node.id], :limit => '14', :order => 'date DESC')
		clients = []
		neighbors = []
		dates = []
		days = ["Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag", "Sonntag"]
  	heartbeats.each { |beat|
  		clients <<  beat.clients.to_i
			neighbors << beat.neighbors.to_i
			dates << beat.date.strftime("%d.%m") }
		
#http://chart.apis.google.com/chart?cht=bvg&chs=600x150&chd=t:7,24,18&chl=26.06|27.06|28.06&chxt=r
#Use this

	max_clients = clients.max + 10 - (clients.max % 10)
	open("/home/robin/www/heartbeat.basicinside.de/public/clients/#{@node.id}.png", 'wb') do |f|
  	f << open(URI.encode("http://chart.apis.google.com/chart?cht=bvg&chs=600x150&chd=t:#{clients.join(',')}&chl=#{dates.join('|')}&chxt=r&chds=0,#{max_clients}&chxr=0,0,#{max_clients},5")).read
	end

	max_neighbors = neighbors.max + 10 - (neighbors.max % 10)
	open("/home/robin/www/heartbeat.basicinside.de/public/neighbors/#{@node.id}.png", 'wb') do |f|
  	f << open(URI.encode("http://chart.apis.google.com/chart?cht=bvg&chs=600x150&chd=t:#{neighbors.join(',')}&chl=#{dates.join('|')}&chxt=r&chds=0,#{max_neighbors}&chxr=0,0,#{max_neighbors},1")).read
	end


  

	respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml => @node }
      format.kml  { render :xml => @node }
    end
  end

 	#function triggered by heartbeat script (node side)
  def status
  	 if !params[:node_id] || !(/^[0-9a-f]{32}$/.match(params[:node_id]))
  	 	flash[:notice] = 'Update fehlgeschlagen<br />Interner Fehler: Datenbank nicht erreichbar.<br /> Bitte versuchen Sie es später noch einmal.'
      redirect_to :action => "index"
      return
  	 end
  
		#support older version typo
		params[:version]  ||= params[:rev]
		params[:neighbors] ||= params[:neighboors]
  	#check for node
		
  	node = Node.find_or_create_by_node_id(params[:node_id]) 
		
		#update or create values
		node.version 	= params[:version] 		if params[:version]
		node.name 	= params[:name] 	if params[:name]
		node.lat 	= params[:lat] 		if params[:lat]
		node.lon 	= params[:lon] 		if params[:lon]
		node.save

		if node.last_seen.nil? || node.last_seen < Date.today
			heartbeat = Heartbeat.new
			heartbeat.node = node
			heartbeat.date = Date.today
			#check for first time arrival
			if Heartbeat.find_by_node_id(node.id) == nil
				Score.new(:variant => 0, :score => 500, :node_id => node.id).save
			end
			
			#validate score
			#heartbeat score
			Score.new(:variant => 1, :score => 5, :node_id => node.id).save

			#clients score
			heartbeat.clients = params[:clients].to_i if params[:clients]
			Score.new(:variant => 2, :score => 1 * params[:clients].to_i, :node_id => node.id).save
				#neighbors score
			heartbeat.neighbors = params[:neighbors].to_i if params[:neighbors]
			Score.new(:variant => 3, :score => 2 * params[:neighbors].to_i, :node_id => node.id).save
			
			heartbeat.save

			#set last_seen
			node.last_seen = Date.today
      node.save

		end
 			
  		
  			
 						
  	respond_to do |format|
      if node.save
        flash[:notice] = 'Node was successfully created.'
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => node, :status => :created, :location => node }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => node.errors, :status => :unprocessable_entity }
      end
    end
  end
  		

  # DELETE /nodes/1
  # DELETE /nodes/1.xml
  #def destroy
  #  @node = Node.find(params[:id])
  #  @node.destroy

  #  respond_to do |format|
  #    format.html { redirect_to(nodes_url) }
  #    format.xml  { head :ok }
  #  end
  #end
end
