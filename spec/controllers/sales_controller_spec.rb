require 'rails_helper'

RSpec.describe SalesController, :type => :controller do

  #
  # Valid parameters
  # 
  let(:valid_parameters) do
    {
      sales: [
        {
          date: '20140103',
          time: '0700',
          code: 'FL',
          value: '2.00'
        },
        {
          date: '20140103',
          time: '0815',
          code: 'DO',
          value: '1.00'
        }
      ]
    }
  end

  let(:invalid_parameters) {
    {
      value: 1.00
    }
  }

  let(:valid_attributes) do
    { 
      date: DateTime.now,
      value: 1.00,
      code: 'DO'
    }
  end


  #
  # SHOW
  #

  describe "GET show" do
    it "assigns the requested sale as @sale" do
      sale = Sale.create! valid_attributes
      get :show, {:id => sale.to_param}
      expect(assigns(:sale)).to eq(sale)
    end
  end


  #
  # CREATE
  # 

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sale" do
        expect {
          post :create, valid_parameters 
        }.to change(Sale, :count).by(2)
      end

      it "assigns a newly created sale as @sale" do
        post :create, valid_parameters
        expect(assigns(:sales)).to be_a(Array)
      end

      it "responds with JSON" do
        post :create, valid_parameters
        parsed_response = JSON.parse(response.body)

        expect(parsed_response["data"].length).to eq 2
      end

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sale as @sale" do
        expect {
          post :create, invalid_parameters
        }.to raise_error ActionController::ParameterMissing
      end
    end
  end


  #
  # DELETE
  #

  describe "DELETE destroy" do
    it "destroys the requested sale" do
      sale = Sale.create! valid_attributes
      expect {
        delete :destroy, {:id => sale.to_param}
      }.to change(Sale, :count).by(-1)
    end

  end

end
