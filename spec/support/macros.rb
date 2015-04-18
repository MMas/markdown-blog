module ControllerMacros
  def login_administrator!
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:administrator]
      admin = FactoryGirl.create(:administrator) # Using factory girl as an example
      sign_in admin #only works for controllers
    end
  end
end

module ViewMacros
  def login_administrator!
    before(:each) do
      admin = FactoryGirl.create(:administrator) # Using factory girl as an example
      visit new_administrator_session_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Sign in'
    end
  end
end
