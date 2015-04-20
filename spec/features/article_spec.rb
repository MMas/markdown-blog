require 'spec_helper'

feature 'article' do

  background do
    login_administrator!
    create_article
  end

  scenario 'is added' do
    expect(page).to have_content('created')
  end

  scenario 'is edited' do
    edit_article
    expect(page).to have_content('updated')
  end

  scenario 'is deleted' do
    delete_article
    expect(page).to have_content('destroyed')
  end


  def create_article
    visit admin_articles_path
    click_link 'Add an Article'
    fill_in 'Name', with: 'test name'
    fill_in 'Content', with: 'test article content'
    click_button 'Create Article'
  end

  def edit_article
    visit admin_articles_path
    click_link 'Edit'
    fill_in 'Name', with: 'test name 2'
    click_button 'Update Article'
  end

  def delete_article
    visit admin_articles_path
    click_link('Destroy')
  end

end
