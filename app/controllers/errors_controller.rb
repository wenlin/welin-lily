class ErrorsController < ApplicationController
  # GET /errors
  # GET /errors.xml
  def index
    @errors = Errors.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @errors }
    end
  end

  # GET /errors/1
  # GET /errors/1.xml
  def show
    @errors = Errors.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @errors }
    end
  end

  # GET /errors/new
  # GET /errors/new.xml
  def new
    @errors = Errors.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @errors }
    end
  end

  # GET /errors/1/edit
  def edit
    @errors = Errors.find(params[:id])
  end

  # POST /errors
  # POST /errors.xml
  def create
    @errors = Errors.new(params[:errors])

    respond_to do |format|
      if @errors.save
        flash[:notice] = 'Errors was successfully created.'
        format.html { redirect_to(@errors) }
        format.xml  { render :xml => @errors, :status => :created, :location => @errors }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @errors.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /errors/1
  # PUT /errors/1.xml
  def update
    @errors = Errors.find(params[:id])

    respond_to do |format|
      if @errors.update_attributes(params[:errors])
        flash[:notice] = 'Errors was successfully updated.'
        format.html { redirect_to(@errors) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @errors.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /errors/1
  # DELETE /errors/1.xml
  def destroy
    @errors = Errors.find(params[:id])
    @errors.destroy

    respond_to do |format|
      format.html { redirect_to(errors_url) }
      format.xml  { head :ok }
    end
  end
end
