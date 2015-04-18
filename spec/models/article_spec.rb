require 'rails_helper'

RSpec.describe Article, :type => :model do

  before do
    @article = FactoryGirl.create(:article)
  end
  
  subject { @article }

  it { should respond_to(:name) }
  it { should respond_to(:content) }
  it { should be_valid }

end
