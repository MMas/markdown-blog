require 'rails_helper'

RSpec.describe Frontend::ArticlesController, :type => :controller do

  before(:each) do
    @article = FactoryGirl.create(:article)
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, id: @article.id
      expect(response).to be_success
    end
  end

end
