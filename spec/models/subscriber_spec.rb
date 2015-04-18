require 'rails_helper'

RSpec.describe Subscriber, :type => :model do

  before do
    @subscriber = FactoryGirl.create(:subscriber)
  end

  subject { @subscriber }

  it "should have a valid factory" do
    expect(FactoryGirl.create(:subscriber)).to be_valid
  end

  it { should respond_to(:email) }
  it { should be_valid }

end
