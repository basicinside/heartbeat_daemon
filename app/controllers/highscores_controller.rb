class HighscoresController < ApplicationController
  # GET /nodes
  # GET /nodes.xml
  def crews
    @crews = Group.find(:all,  :select => "groups.id, groups.name, SUM(scores.score) AS score",
                :joins =>  {:users => {:nodes => :scores}}, :group => "groups.id", :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
    end
  end
  
  def top10
    @top10 = Node.find(:all,  :select => "nodes.*, SUM(scores.score) AS score",
                :joins =>  :scores, :group => "nodes.id", :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
      format.rss  { render :rss => @nodes }
    end
  end
  
  # GET /nodes
  # GET /nodes.xml
  def bundeslaender
    @lvs = Province.find(:all,  :select => "provinces.*, SUM(scores.score) AS score", 
                :joins => {:locations =>  {:users => {:nodes => :scores}}}, :group => "provinces.id", :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
    end
  end
  
def parteien
    @parteis = Party.find(:all,  :select => "parties.*, SUM(scores.score) AS score",
                :joins =>  {:users => {:nodes => :scores}},:group => "parties.id", :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
    end
  end
 end
