class HighscoresController < ApplicationController
  # GET /nodes
  # GET /nodes.xml
  def groups
    last_seen = Date.today - 7.days
    @groups = Group.find(:all,  :select => "groups.id, groups.name, SUM(scores.score) AS score", :conditions => ["nodes.last_seen > '#{last_seen}'"],
                :joins =>  {:users => {:nodes => :scores}}, :group => "groups.id", :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
    end
  end

   def users
    last_seen = Date.today - 7.days
    @users = User.find(:all,  :select => "users.id, users.username, SUM(scores.score) AS score", :conditions => ["nodes.last_seen > '#{last_seen}'"],
                :joins =>  {:nodes => :scores}, :group => "users.id", :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
    end
  end
  
  def nodes
  last_seen = Date.today - 7.days
    @nodes = Node.find(:all,  :select => "nodes.*, SUM(scores.score) AS score", :conditions => ["nodes.last_seen > '#{last_seen}'"],
                :joins =>  :scores, :group => "nodes.id", :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
      format.rss  { render :rss => @nodes }
    end
  end
  
  # GET /nodes
  # GET /nodes.xml
  def provinces
    last_seen = Date.today - 7.days
    @provinces = Province.find(:all,  :select => "provinces.*, SUM(scores.score) AS score",  :conditions => ["nodes.last_seen > '#{last_seen}'"],
                :joins => {:locations =>  {:users => {:nodes => :scores}}}, :group => "provinces.id", :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
    end
  end

   def parties
    last_seen = Date.today - 7.days
    @parties = Party.find(:all,  :select => "parties.id, parties.name, SUM(scores.score) AS score",  :conditions => ["nodes.last_seen > '#{last_seen}'"],
                :joins =>  {:users => {:nodes => :scores}}, :group => "parties.id", :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
    end
  end
   def locations
    last_seen = Date.today - 7.days
    @locations = Location.find(:all,  :select => "locations.id, locations.name, SUM(scores.score) AS score",  :conditions => ["nodes.last_seen > '#{last_seen}'"],
                :joins =>  {:users => {:nodes => :scores}}, :group => "locations.id", :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
    end
  end
 

 end
