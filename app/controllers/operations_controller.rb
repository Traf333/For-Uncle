# encoding: utf-8
class OperationsController < ApplicationController
  
  before_filter :correct_client


  # POST /operations
  # POST /operations.json
  def create
    @operation = @client.operations.build(params[:operation])
    
    respond_to do |format|
      if @operation.save
        flash[:success] = "Операция совершена"
        format.html { redirect_to @client }
      else
        @feed_items = []
        flash[:error] = "Неправильно введена сумма."
        format.html { redirect_to @client }
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
