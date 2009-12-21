class MemosController < ApplicationController
 before_filter :set_p

  # GET /memos
  # GET /memos.xml
  def index
    #@memos = Memo.find(:all, :conditions => {:p_next => @p_current}, :order=>'t_next DESC')
    @memos = Memo.find(:all, :conditions => ["p_next = ?", @p_current], :order=>'t_next DESC')
    @memo_focus = @memos.first
    @memos_delayed = Memo.find(:all, :conditions => ["p_next < ?", @p_current], :order=>'t_next DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memos }
    end
  end
  
  def all

    @p_current = 1000
    @memos = Memo.find(:all, :conditions => ["p_next <= ?", @p_current], :order=>'p_next')
    @memos_delayed = Memo.find(:all, :conditions => ["p_next < ?", @p_current], :order=>'t_next DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memos }
    end
  end

  # GET /memos/1
  # GET /memos/1.xml
  def show
    @memo = Memo.find(params[:id])
    @memos = Memo.find(:all, :conditions => ["p_next = ?", @p_current], :order=>'t_next DESC')
    @memos_delayed = Memo.find(:all, :conditions => ["p_next < ?", @p_current], :order=>'t_next DESC')

    if params[:p] == nil 
      @p_current = get_p_current()
    else
      @p_current = params[:p]
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @memo }
    end
  end

  # GET /memos/new
  # GET /memos/new.xml
  def new
    @memo = Memo.new
    @memos = Memo.find(:all, :conditions => ["p_next = ?", @p_current], :order=>'t_next DESC')
    @memos_delayed = Memo.find(:all, :conditions => ["p_next < ?", @p_current], :order=>'t_next DESC')

    if params[:p] == nil 
      @p_current = get_p_current()
    else
      @p_current = params[:p]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @memo }
    end
  end

  # GET /memos/1/edit
  def edit
    @memos = Memo.find(:all, :conditions => ["p_next = ?", @p_current], :order=>'t_next DESC')
    @memos_delayed = Memo.find(:all, :conditions => ["p_next < ?", @p_current], :order=>'t_next DESC')

    @memo = Memo.find(params[:id])
  end

  def done
    @memos = Memo.find(:all, :conditions => ["p_next = ?", @p_current], :order=>'t_next DESC')
    @memos_delayed = Memo.find(:all, :conditions => ["p_next < ?", @p_current], :order=>'t_next DESC')

    @memo = Memo.find(params[:id])
    
    if params[:p] == nil 
      @p_current = get_p_current()
    else
      @p_current = params[:p]
    end

  end
  
  def round
    @memos = Memo.find(:all, :conditions => ["p_next = ?", @p_current], :order=>'t_next DESC')
    @memos_delayed = Memo.find(:all, :conditions => ["p_next < ?", @p_current], :order=>'t_next DESC')

    @memo = Memo.find(params[:id])
    @p_current = get_p_current()
  end

  # POST /memos
  # POST /memos.xml
  def create
    @memo = Memo.new(params[:memo])
    @memos = Memo.find(:all, :conditions => ["p_next = ?", @p_current], :order=>'t_next DESC')
    @memos_delayed = Memo.find(:all, :conditions => ["p_next < ?", @p_current], :order=>'t_next DESC')


    respond_to do |format|
      if @memo.save
        flash[:notice] = '创建成功'
        format.html { redirect_to(:action => "index") }
        format.xml  { render :xml => @memo, :status => :created, :location => @memo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @memo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /memos/1
  # PUT /memos/1.xml
  def update
    @memo = Memo.find(params[:id])
    @memos = Memo.find(:all, :conditions => ["p_next = ?", @p_current], :order=>'t_next DESC')
    @memos_delayed = Memo.find(:all, :conditions => ["p_next < ?", @p_current], :order=>'t_next DESC')

    respond_to do |format|
      if @memo.update_attributes(params[:memo])
        flash[:notice] = '信息已更新'
        format.html { redirect_to(:action => "index") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @memo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /memos/1
  # DELETE /memos/1.xml
  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    @memos = Memo.find(:all, :conditions => ["p_next = ?", @p_current], :order=>'t_next DESC')
    @memos_delayed = Memo.find(:all, :conditions => ["p_next < ?", @p_current], :order=>'t_next DESC')

    respond_to do |format|
      format.html { redirect_to(memos_url) }
      format.xml  { head :ok }
    end
  end
  
  private
    def set_p
        if params[:p] == nil 
          @p_current = get_p_current()
        else
          @p_current = params[:p]
        end
    end

end
