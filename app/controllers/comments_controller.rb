class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @site = Site.find(params['site_id'])
    @comments = @site.comments.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @site = Site.find(params['site_id'])
    @comment = @site.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @site = Site.find(params['site_id'])
    @comment = @site.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @site = Site.find(params['site_id'])
    @comment = @site.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @site = Site.find(params['site_id'])
    @comment = @site.comments.build(params[:comment])


    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to site_comment_url(@site,@comment) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @site = Site.find(params['site_id'])
    @comment = @site.comments.find(params[:id])


    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to site_comment_url(@site,@comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @site = Site.find(params['site_id'])
    @comment = @site.comments.find(params[:id])

    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(site_comments_url(@site)) }
      format.xml  { head :ok }
    end
  end
end
