class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @proposal = Proposal.find(params['proposal_id'])
    @comments = @proposal .comments.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @proposal = Proposal.find(params['proposal_id'])
    @comment = @proposal.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @proposal = Proposal.find(params['proposal_id'])
    @comment = @proposal.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @proposal = Proposal.find(params['proposal_id'])
    @comment = @proposal.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @proposal = Proposal.find(params['proposal_id'])
    @comment = @proposal.comments.build(params[:comment])


    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(@comment) }
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
    @proposal = Proposal.find(params['proposal_id'])
    @comment = @proposal.comments.find(params[:id])


    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
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
    @proposal = Proposal.find(params['proposal_id'])
    @comment = @proposal.comments.find(params[:id])

    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
