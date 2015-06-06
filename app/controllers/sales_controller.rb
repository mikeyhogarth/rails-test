class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]


  # GET /sales/1
  # GET /sales/1.json
  def show
  end


  # POST /sales
  # POST /sales.json
  def create
    Sale.transaction do 
      begin
        @sales = Sale.create!(sale_params)
        render json: @sales, status: :created, location: @sale 
      rescue ActiveRecord::RecordInvalid => invalid
        render json: invalid.record.errors.full_messages, status: :unprocessable_entity 
      end
    end
  end


  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    head :no_content
  end


  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sales).each do |s|
      s.permit(:date, :code, :value, :hashed_password)
    end
    
    params[:date] = DateTimeAdapter.convert(params[:time],params[:date])
    params.delete(:time)

  end
end
