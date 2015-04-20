require 'spec_helper'

feature 'administrator logs in' do

  scenario 'with valid email and password' do
    login_administrator!
    expect(page).to have_content('Signed in')
  end

end
