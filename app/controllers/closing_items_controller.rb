class ClosingItemsController < ApplicationController
  # GET /closing_items
  # GET /closing_items.json
  def index
    @closing_items = ClosingItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @closing_items }
    end
  end

  # GET /closing_items/1
  # GET /closing_items/1.json
  def show
    @closing_item = ClosingItem.find(params[:id])
    session[:current_closingitem_values] = params 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @closing_item }
    end
  end

  # GET /closing_items/new
  # GET /closing_items/new.json

  def new
    @closing_item = ClosingItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @closing_item }
    end
  end

  # GET /closing_items/1/edit
  def edit
    @closing_item = ClosingItem.find(params[:id])
  end

  # POST /closing_items
  # POST /closing_items.json
  def bulk_generate

  end


  def create
    @closing_values = session[:current_closing_values]
    @closing_item = ClosingItem.new(params[:closing_item])
    @closing_item.closing_id = @closing_values[:id]
    @closing_item.dealname = @closing_values[:dealname]
    @closing_item.author = current_user.email

    respond_to do |format|
      if @closing_item.save
        format.html { redirect_to @closing_item, notice: 'Closing Item was successfully created.' }
        format.json { render json: @closing_item, status: :created, location: @closing_item }
      else
        format.html { render action: "new" }
        format.json { render json: @closing_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /closing_items/1
  # PUT /closing_items/1.json
  def update
    @closing_item = ClosingItem.find(params[:id])

    respond_to do |format|
      if @closing_item.update_attributes(params[:closing_item])
        format.html { redirect_to @closing_item, notice: 'Closing item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @closing_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /closing_items/1
  # DELETE /closing_items/1.json
  def destroy
    @closing_values = session[:current_closing_values]
    @closing_item = ClosingItem.find(params[:id])
    @closing_item.destroy

     respond_to do |format|
      format.html { redirect_to :action => "show", :id => @closing_values[:id], 
:controller => "closings" }
      format.json { head :no_content }
    end
  end
end
