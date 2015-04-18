require 'rails_helper'

RSpec.describe Admin::ArticlesController, :type => :controller do

  login_administrator!

  before(:each) do
    # @article = FactoryGirl.create(:article)
    @article = FactoryGirl.create(:article, administrator: subject.current_administrator)
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, id: @article.slug
      expect(response).to be_success
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, id: @article.slug
      expect(response).to be_success
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy, id: @article.slug
      expect(response).to redirect_to(admin_articles_path)
    end
  end

end
