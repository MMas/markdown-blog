require 'spec_helper'

feature 'subscription' do

  background do
    create_subscription
  end

  scenario 'is subscribed' do
    expect(page).to have_content('subscribed')
  end

  scenario 'is unsubscribed' do
    unsubscribe
    expect(page).to have_content('unsubscribed')
  end

  def create_subscription
    visit frontend_root_path
    find('#email').set('test@test.com')
    click_button 'Subscribe'
  end

  def unsubscribe
    visit unsubscribe_frontend_subscriptions_path(Subscriber.first)
  end

end
