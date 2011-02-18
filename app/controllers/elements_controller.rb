class ElementsController < ApplicationController
  before_filter :require_user, :except => :home_page
  before_filter :find_account, :except => :new
  # GET /elements
  # GET /elements.xml
  def index
    @elements = @account.elements
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @elements }
    end
  end

  # GET /elements/1
  # GET /elements/1.xml
  def show
    @element = @account.elements.find(params[:id])
    respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @element }
        format.json { render :json => @element }
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
    @element = @account.elements.find(params[:id]) 
  end

  # POST /elements
  # POST /elements.xml
  def create
    @element = Element.new(params[:element])
    @element.owner = @account
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
    @element = @account.elements.find(params[:id])

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
    @element = @account.elements.find(params[:id])
    @element.destroy
    respond_to do |format|
        format.html { redirect_to(elements_url) }
    end
  end
  
  private
  def find_account
    @account = Account.find_by_subdomain!(request.subdomain)
  end
end
