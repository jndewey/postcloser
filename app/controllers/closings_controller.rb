class ClosingsController < ApplicationController
  # GET /closings
  # GET /closings.json
  def index
    @user_closings = Array.new
    @closings = Closing.all
    @closings.each do |closing|
       if closing.team_leader.include?(current_user.email)
        @user_closings << closing
       end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @closings }
    end
  end

  # GET /closings/1
  # GET /closings/1.json
  def show
    @closing = Closing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @closing }
    end
  end

  # GET /closings/new
  # GET /closings/new.json
  def new
    @closing = Closing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @closing }
    end
  end

  # GET /closings/1/edit
  def edit
    @closing = Closing.find(params[:id])
  end

  # POST /closings
  # POST /closings.json
  def create
    @closing = current_user.closings.new(params[:closing])

    respond_to do |format|
      if @closing.save
        format.html { redirect_to @closing, notice: 'Closing was successfully created.' }
        format.json { render json: @closing, status: :created, location: @closing }
      else
        format.html { render action: "new" }
        format.json { render json: @closing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /closings/1
  # PUT /closings/1.json
  def update
    @closing = Closing.find(params[:id])
    if params[:closing] && params[:closing].has_key?(:user_id)
       params[:closing].delete(:user_id)
     end
     
    respond_to do |format|
      if @closing.update_attributes(params[:closing])
        format.html { redirect_to @closing, notice: 'Closing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @closing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /closings/1
  # DELETE /closings/1.json
  def destroy
    @closing = Closing.find(params[:id])
    @closing.destroy

    respond_to do |format|
      format.html { redirect_to closings_url }
      format.json { head :no_content }
    end
  end
end
