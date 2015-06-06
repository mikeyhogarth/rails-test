require 'rails_helper'

RSpec.describe SalesController, :type => :controller do

  #
  # Valid parameters
  # 
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
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
          post :create, {:sale => valid_attributes}, valid_session
        }.to change(Sale, :count).by(1)
      end

      it "assigns a newly created sale as @sale" do
        post :create, {:sale => valid_attributes}, valid_session
        expect(assigns(:sale)).to be_a(Sale)
        expect(assigns(:sale)).to be_persisted
      end

      it "redirects to the created sale" do
        post :create, {:sale => valid_attributes}, valid_session
        expect(response).to redirect_to(Sale.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sale as @sale" do
        post :create, {:sale => invalid_attributes}, valid_session
        expect(assigns(:sale)).to be_a_new(Sale)
      end

      it "re-renders the 'new' template" do
        post :create, {:sale => invalid_attributes}, valid_session
        expect(response).to render_template("new")
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
        delete :destroy, {:id => sale.to_param}, valid_session
      }.to change(Sale, :count).by(-1)
    end

    it "redirects to the sales list" do
      sale = Sale.create! valid_attributes
      delete :destroy, {:id => sale.to_param}, valid_session
      expect(response).to redirect_to(sales_url)
    end
  end

end
