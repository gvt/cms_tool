class ElementsController < ApplicationController
  before_filter :require_user, :except => :home_page
  # GET /elements
  # GET /elements.xml
  def index
    @account = Account.find_by_subdomain!(request.subdomain) 
    @elements = @account.elements
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @elements }
    end
  end

  # GET /elements/1
  # GET /elements/1.xml
  def show
    @element = Element.find(params[:id])
    @account = Account.find_by_subdomain!(request.subdomain)
    respond_to do |format|
      if @element.owner == @account
        format.html # show.html.erb
        format.xml  { render :xml => @element }
        format.json { render :json => @element }
      else
        format.html {redirect_to(account_path, :notice => "#{@account.name} does not own that element")}
      end
    end
  end

  # GET /elements/new
  # GET /elements/new.xml
  def new
    @element = Element.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @element }
    end
  end

  # GET /elements/1/edit
  def edit
    @element = Element.find(params[:id]) 
  end

  # POST /elements
  # POST /elements.xml
  def create
    @element = Element.new(params[:element])
    @element.owner = Account.find_by_subdomain!(request.subdomain) 
    respond_to do |format|
      if @element.save
        format.html { redirect_to(@element, :notice => 'Element was successfully created.') }
        format.xml  { render :xml => @element, :status => :created, :location => @element }
      else
        format.html { render :action => "new", :error => @element.errors.full_messages.to_sentence }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /elements/1
  # PUT /elements/1.xml
  def update
    @element = Element.find(params[:id])

    respond_to do |format|
      if @element.update_attributes(params[:element])
        format.html { redirect_to(@element, :notice => 'Element was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /elements/1
  # DELETE /elements/1.xml
  def destroy
    @element = Element.find(params[:id])
    @account = Account.find_by_subdomain!(request.subdomain)
    respond_to do |format|
      if @element.owner == @account
        @element.destroy
        format.html { redirect_to(elements_url) }
      else
        format.html {redirect_to(account_path, :notice => "#{@account.name} does not own that element")}
      end
    end
  end
end
