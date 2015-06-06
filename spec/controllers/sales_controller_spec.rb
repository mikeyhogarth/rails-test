require 'rails_helper'

RSpec.describe SalesController, :type => :controller do

  CORRECT_PASSWORD = "a_password"

  #
  # Valid parameters
  # 
  let(:valid_parameters) do
    {
      password: CORRECT_PASSWORD,
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


  let(:valid_parameters_singular) do
    {
      password: CORRECT_PASSWORD,
      sale: {
        date: '20140103',
        time: '0700',
        code: 'FL',
        value: '2.00'
      }
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

      it "creates a new set of Sales" do
        expect {
          post :create, valid_parameters 
        }.to change(Sale, :count).by(2)
      end

      it "assigns a newly created sales as @sales" do
        post :create, valid_parameters
        expect(assigns(:sales)).to be_a(Array)
      end

      it "also works for singular resources" do
        expect {
          post :create, valid_parameters_singular
        }.to change(Sale, :count).by(1)
        expect(assigns(:sales)).to be_a(Array)
      end

      it "correctly stores the date" do
        post :create, valid_parameters
        first_sale = assigns(:sales).first
        first_sale_date = first_sale.date
        
        expect(first_sale_date.strftime('%H%M')).to eq "0700"
        expect(first_sale_date.strftime('%Y%m%d')).to eq "20140103"
      end

      it "hashes and assigns the password.." do
        post :create, valid_parameters
        first_sale = assigns(:sales).first
        expect(first_sale.hashed_password).not_to be_blank
        expect(first_sale.hashed_password).not_to eq CORRECT_PASSWORD
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
