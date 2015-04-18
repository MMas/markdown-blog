require 'rails_helper'

RSpec.describe Administrator, :type => :model do

  before do
  @administrator = Administrator.create( {
                      email: "joe.bloggs@test.com",
                      password: "Pa55word",
                      password_confirmation: "Pa55word",
                    })
  end

  subject { @administrator  }

  it "should have a valid factory" do
    expect(FactoryGirl.create(:administrator)).to be_valid
  end

  it { should respond_to(:email) }
  it { should be_valid }

end
