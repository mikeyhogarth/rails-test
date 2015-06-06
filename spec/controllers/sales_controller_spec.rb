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

  let(:valid_attributes) do
    { 
      date: DateTime.now,
      value: 1.00,
      code: 'DO'
    }
  end

  let(:invalid_attributes) {
    skip("No instruction given about what is valid/invalid")
  }


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
          post :create, {:sale => valid_attributes}
        }.to change(Sale, :count).by(1)
      end

      it "assigns a newly created sale as @sale" do
        post :create, {:sale => valid_attributes}
        expect(assigns(:sale)).to be_a(Sale)
        expect(assigns(:sale)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sale as @sale" do
        post :create, {:sale => invalid_attributes}
        expect(assigns(:sale)).to be_a_new(Sale)
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
