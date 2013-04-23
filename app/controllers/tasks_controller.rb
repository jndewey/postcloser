class TasksController < ApplicationController
  # GET /closing_items
  # GET /closing_items.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /closing_items/1
  # GET /closing_items/1.json
  def show
    @closingitem_values = session[:current_closingitem_values]
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /closing_items/new
  # GET /closing_items/new.json

  def new
    @task = Task.new
     @closingitem_values = session[:current_closingitem_values]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /closing_items/1/edit
  def edit
    @closingitem_values = session[:current_closingitem_values]
    @task = Task.find(params[:id])
  end

  # POST /closing_items
  # POST /closing_items.json
  def create
    @closingitem_values = session[:current_closingitem_values]
    @task = Task.new(params[:task])
    @task.closing_item_id = @closingitem_values[:id]
    @task.author = current_user.email

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /closing_items/1
  # PUT /closing_items/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Closing item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /closing_items/1
  # DELETE /closing_items/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
