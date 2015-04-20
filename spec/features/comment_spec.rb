require 'spec_helper'

feature 'comment' do

  background do
    create_comment
  end

  scenario 'is posted' do
    expect(page).to have_content('posted')
  end


  def create_article
    login_administrator!
    visit admin_articles_path
    click_link 'Add an Article'
    fill_in 'Name', with: 'test article with comment'
    fill_in 'Content', with: 'test article content'
    click_button 'Create Article'
  end

  def create_comment
    create_article
    visit frontend_article_path(Article.first)
    fill_in 'Title', with: 'test comment'
    fill_in 'Comment', with: 'test comment comment'
    click_button 'Post Comment'
  end

end
