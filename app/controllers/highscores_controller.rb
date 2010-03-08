class HighscoresController < ApplicationController
  # GET /nodes
  # GET /nodes.xml
  def crews
    @crews = Crew.find(:all,  :select => "crews.id, crews.name, SUM(scores.score) AS score",
                :joins =>  :scores, :group => "crews.id", :order => 'SUM(scores.score) DESC')

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
  def landesverbaende
    @lvs = Landesverband.find(:all,  :select => "landesverbands.*, SUM(scores.score) AS score", 
                :joins =>  {:nodes => :scores}, :group => "landesverbands.id", :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
    end
  end
  
def parteien
    @parteis = Partei.find(:all,  :select => "parteis.*, SUM(scores.score) AS score",
                :joins =>  {:crews => {:nodes => :scores}},:group => "parteis.id", :order => 'SUM(scores.score) DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nodes }
    end
  end
 end
