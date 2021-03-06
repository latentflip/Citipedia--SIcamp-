class SitesController < ApplicationController
  # GET /sites
  # GET /sites.xml
    def data
      @sites = Site.all
      data = @sites.map do |site|
      {
        :label => site.title,
        :lat => "#{site.latitude}",
        :long => "#{site.longitude}",
        :details => site.description,
        :type => site.btype,
        :image => site.photo,
        :id => site.id,
      }
    end
    data.compact!

    respond_to do |format|
      format.json { render :json => { :items => data } }
    end
  end

  def index
    if params[:tag]
      @sites = Site.all(:conditions => ["tag LIKE ?", "%#{params[:tag]}%"])
    else
      @sites = Site.all
    end

    respond_to do |format|
      format.html { }# index.html.erb
      format.xml  { render :xml => @sites }
    end
  end
  
  def heatmap
    @sites = Site.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def home
    @sites = Site.all
    
    respond_to do |format|
      format.html
    end
  end

  # GET /sites/1
  # GET /sites/1.xml
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.xml
  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.xml
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        flash[:notice] = 'Site was successfully created.'
        format.html { redirect_to(@site) }
        format.xml  { render :xml => @site, :status => :created, :location => @site }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.xml
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        flash[:notice] = 'Site was successfully updated.'
        format.html { redirect_to(@site) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.xml
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to(sites_url) }
      format.xml  { head :ok }
    end
  end
end
