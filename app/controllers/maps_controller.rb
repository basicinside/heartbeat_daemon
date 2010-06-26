class MapsController < ApplicationController
  def index
		@lon = params[:lon] 
    @lat = params[:lat] 
    @zoom = params[:zoom]
 
    @map = MapLayers::Map.new("map", :displayProjection => OpenLayers::Projection.new("EPSG:4326"),
 :projection => OpenLayers::Projection.new("EPSG:4326")) do |map, page|
      
      page << map.add_control(Control::Navigation.new())
      page << map.add_control(Control::PanZoomBar.new())
      page << map.add_control(Control::LayerSwitcher.new)
      page << map.add_control(Control::Attribution.new())
      page << map.add_control(Control::Permalink.new('permalink'))
      page << map.add_control(Control::MousePosition.new())
 			page << map.add_control(Control::SelectFeature.new())
 
      page << map.add_control(Control::OverviewMap.new({ :layers => [ MapLayers::OSM_MAPNIK ]}))
      
  		#page.assign("markers", Layer::Markers.new('Knoten-Marker'))
 			#page << map.addLayer(:markers, :projection => OpenLayers::Projection.new("EPSG:900913"))
  		
 
      page << map.add_layer(MapLayers::OSM_MAPNIK , :projection => OpenLayers::Projection.new("EPSG:4326"))
      
    	page << map.add_layer(Layer::GeoRSS.new("Nodes", "/nodes/georss", { :projection => OpenLayers::Projection.new("EPSG:4326"), 
    	 :icon => OpenLayers::Icon.new("/images/flag.png", OpenLayers::Size.new(20,20))}))
    	
    	lonlat =  OpenLayers::LonLat.new(@lon, @lat).transform(OpenLayers::Projection.new("EPSG:4326"), map.getProjectionObject())
    	page << map.set_center(lonlat, @zoom )     

    end
	end
end
