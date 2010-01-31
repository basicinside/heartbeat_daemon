class MapsController < ApplicationController
  def index
		@lon = params[:lon] 
    @lat = params[:lat] 
    @zoom = params[:zoom]
 
    @map = MapLayers::Map.new("map", :projection => OpenLayers::Projection.new("EPSG:900913")) do |map, page|
      
      page << map.add_control(Control::Navigation.new())
      page << map.add_control(Control::PanZoomBar.new())
      page << map.add_control(Control::LayerSwitcher.new)
      page << map.add_control(Control::Attribution.new())
      page << map.add_control(Control::Permalink.new('permalink'))
      page << map.add_control(Control::MousePosition.new())
 			page << map.add_control(Control::SelectFeature.new())
 
      page << map.add_control(Control::OverviewMap.new({ :layers => [ MapLayers::OSM_MAPNIK ]}))
      
  		page.assign("markers", Layer::Markers.new('Knoten-Marker'))
 			page << map.addLayer(:markers, :projection => OpenLayers::Projection.new("EPSG:900913"))
  		
 
      page << map.add_layer(MapLayers::OSM_MAPNIK)
      
    	page << map.add_layer(Layer::GeoRSS.new("Nodes", "/nodes/georss", { :projection => OpenLayers::Projection.new("EPSG:900913"), 
    	 :icon => OpenLayers::Icon.new("/images/flag.png", OpenLayers::Size.new(50,50))}))
    
      page << map.set_center(OpenLayers::LonLat.new(@lon, @lat))
    end
	end
end
