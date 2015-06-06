class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]


  # GET /sales/1
  # GET /sales/1.json
  def show
  end


  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      render :show, status: :created, location: @sale 
    else
      render json: @sale.errors, status: :unprocessable_entity 
    end
  end


  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    format.json { head :no_content }
  end


  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:date, :code, :value, :hashed_password)
  end
end
