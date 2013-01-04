# encoding: utf-8
class OperationsController < ApplicationController
  # GET /operations
  # GET /operations.json
  def index
    @client = Client.find(params[:client_id])
    @operations = @client.operations

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operations }
    end
  end

  # GET /operations/1
  # GET /operations/1.json
  def show
    @client = Client.find(params[:client_id])
    @operation = @client.operations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @operation }
    end
  end

  # GET /operations/new
  # GET /operations/new.json
  def new
    @client = Client.find(params[:client_id])
    @operation = @client.operations.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @operation }
    end
  end

  # GET /operations/1/edit
  def edit
    @client = Client.find(params[:client_id])
    @operation = @client.operations.find(params[:client_id])
  end

  # POST /operations
  # POST /operations.json
  def create
    @client = Client.find(params[:client_id])
    @operation = @client.operations.new(params[:operation])

    respond_to do |format|
      if @operation.save
        flash[:success] = "Операция совершена"
        format.html { redirect_to @client }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /operations/1
  # PUT /operations/1.json
  def update
    @client = Client.find(params[:client_id])
    @operation = @client.operations.find(params[:client_id])

    respond_to do |format|
      if @operation.update_attributes(params[:operation])
        format.html { redirect_to @operation, notice: 'Operation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1
  # DELETE /operations/1.json
  def destroy
    @operation = Operation.find(params[:id])
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url }
      format.json { head :no_content }
    end
  end
end
