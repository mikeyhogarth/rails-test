class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :destroy]


  # GET /sales/1
  # GET /sales/1.json
  def show
    render json: { data: @sale }
  end


  # POST /sales
  # POST /sales.json
  def create
    Sale.transaction do 
      begin
        @sales = Sale.create!(sale_params)
        render json: { data: @sales }, status: :created
      rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
      end
    end
  end


  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    head :no_content
  end


  #
  # END OF PUBLIC INTERFACE
  #

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end


  #
  # sale_params
  #
  # Converts incoming parameters into appropriate attributes
  # for an array of sales
  #
  def sale_params
    password = PasswordHasher.hash(params[:password]) if params[:password]

    params.require(:sales).each do |s|
      s[:date] = DateTimeAdapter.convert(s[:time],s[:date])
      s[:hashed_password] = password
      s.delete(:time)
    end
    params.permit(sales: [:date, :code, :value, :hashed_password])[:sales]
  end


end
