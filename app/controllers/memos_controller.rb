class MemosController < ApplicationController
  # GET /memos
  # GET /memos.xml
  def index
    @days_to_njcee = (DateTime.new(2010, 6, 7) - DateTime.now).to_i
    t = Time.now
    if t.hour < 6
      @p_current = ( 300 - @days_to_njcee) * 3
    elsif t.hour > 6 and t.hour < 12
      @p_current = ( 300 - @days_to_njcee) * 3 + 1
    elsif t.hour > 12 and t.hour < 18
      @p_current = ( 300 - @days_to_njcee) * 3 + 2 
    elsif t.hour > 18
      @p_current = ( 300 - @days_to_njcee) * 3 + 3
    end

    @memos = Memo.find(:all, :conditions => {:p_next => @p_current}, :order=>'t_next DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memos }
    end
  end

  # GET /memos/1
  # GET /memos/1.xml
  def show
    @memo = Memo.find(params[:id])

    @days_to_njcee = (DateTime.new(2010, 6, 7) - DateTime.now).to_i
    t = Time.now
    if t.hour < 6
      @p_current = ( 300 - @days_to_njcee) * 3
    elsif t.hour > 6 and t.hour < 12
      @p_current = ( 300 - @days_to_njcee) * 3 + 1
    elsif t.hour > 12 and t.hour < 18
      @p_current = ( 300 - @days_to_njcee) * 3 + 2 
    elsif t.hour > 18
      @p_current = ( 300 - @days_to_njcee) * 3 + 3
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

    @days_to_njcee = (DateTime.new(2010, 6, 7) - DateTime.now).to_i
    t = Time.now
    if t.hour < 6
      @p_current = ( 300 - @days_to_njcee) * 3
    elsif t.hour > 6 and t.hour < 12
      @p_current = ( 300 - @days_to_njcee) * 3 + 1
    elsif t.hour > 12 and t.hour < 18
      @p_current = ( 300 - @days_to_njcee) * 3 + 2 
    elsif t.hour > 18
      @p_current = ( 300 - @days_to_njcee) * 3 + 3
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @memo }
    end
  end

  # GET /memos/1/edit
  def edit
    @memo = Memo.find(params[:id])
  end

  def done
    @memo = Memo.find(params[:id])
    
    @days_to_njcee = (DateTime.new(2010, 6, 7) - DateTime.now).to_i
    t = Time.now
    if t.hour < 6
      @p_current = ( 300 - @days_to_njcee) * 3
    elsif t.hour > 6 and t.hour < 12
      @p_current = ( 300 - @days_to_njcee) * 3 + 1
    elsif t.hour > 12 and t.hour < 18
      @p_current = ( 300 - @days_to_njcee) * 3 + 2 
    elsif t.hour > 18
      @p_current = ( 300 - @days_to_njcee) * 3 + 3
    end

  end

  # POST /memos
  # POST /memos.xml
  def create
    @memo = Memo.new(params[:memo])

    respond_to do |format|
      if @memo.save
        flash[:notice] = '创建成功'
        format.html { redirect_to(@memo) }
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

    respond_to do |format|
      if @memo.update_attributes(params[:memo])
        flash[:notice] = '信息已更新'
        format.html { redirect_to(@memo) }
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

    respond_to do |format|
      format.html { redirect_to(memos_url) }
      format.xml  { head :ok }
    end
  end
end
