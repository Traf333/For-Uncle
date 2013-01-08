# encoding: utf-8
class OperationsController < ApplicationController
  
  before_filter :correct_client, only: [:index, :show, :new, :create]


  # GET /operations
  # GET /operations.json
  def index
    @operations = @client.operations

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operations }
    end
  end

  # GET /operations/1
  # GET /operations/1.json
  def show
    @operation = @client.operations.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @operation }
    end
  end

  # GET /operations/new
  # GET /operations/new.json
  def new
    @operation = @client.operations.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @operation }
    end
  end

  # GET /operations/1/edit
  def edit
    @operation = @client.operations.find(params[:client_id])
  end

  # POST /operations
  # POST /operations.json
  def create
    @operation = @client.operations.new(params[:operation])
    
    respond_to do |format|
      if @operation.save
        flash[:success] = "Операция совершена"
        format.html { redirect_to @client }
      else
        flash[:error] = "Неправильно введена сумма."
        format.html { redirect_to @client }
      end
    end
  end

  # PUT /operations/1
  # PUT /operations/1.json
  def update
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
      format.html { render clients_path }
      format.json { head :no_content }
    end
  end

  private

    def correct_client
      @client = Client.find(params[:client_id])
    end
end
