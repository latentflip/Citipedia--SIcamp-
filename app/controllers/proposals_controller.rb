class ProposalsController < ApplicationController
  # GET /proposals
  # GET /proposals.xml
  def index
    @site = Site.find(params['site_id'])
    @proposals = @site.proposals.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proposals }
    end
  end

  # GET /proposals/1
  # GET /proposals/1.xml
  def show
    @site = Site.find(params['site_id'])
    @proposal = @site.proposals.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proposal }
    end
  end

  # GET /proposals/new
  # GET /proposals/new.xml
  def new
    @site = Site.find(params['site_id'])
    @proposal = @site.proposals.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proposal }
    end
  end

  # GET /proposals/1/edit
  def edit
    @site = Site.find(params['site_id'])
    @proposal = @site.proposals.find(params[:id])
  end

  # POST /proposals
  # POST /proposals.xml
  def create
    @site = Site.find(params['site_id'])
    @proposal = @site.proposals.build(params[:proposal])

    respond_to do |format|
      if @proposal.save
        flash[:notice] = 'Proposal was successfully created.'
        format.html { redirect_to site_proposal_url(@site,@proposal) }
        format.xml  { render :xml => @proposal, :status => :created, :location => @proposal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @proposal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /proposals/1
  # PUT /proposals/1.xml
  def update
    @site = Site.find(params['site_id'])
    @proposal = @site.proposals.find(params[:id])

    respond_to do |format|
      if @proposal.update_attributes(params[:proposal])
        flash[:notice] = 'Proposal was successfully updated.'
        format.html { redirect_to site_proposal_url(@site,@proposal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @proposal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.xml
  def destroy
    @site = Site.find(params['site_id'])
    @proposal = @site.proposals.find(params[:id])
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to(site_proposals_url(@site)) }
      format.xml  { head :ok }
    end
  end
end
