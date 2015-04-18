require 'rails_helper'

RSpec.describe Admin::SubscribersController, :type => :controller do

  login_administrator!
  
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

end
