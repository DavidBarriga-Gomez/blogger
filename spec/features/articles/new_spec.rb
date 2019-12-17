require 'rails_helper'

RSpec.describe 'User can create a new article', type: :feature do
  before(:each) do
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
  end

  it 'When an article is created a user is redirected to the index page with the new article' do
    visit articles_path

    expect(page).to have_link('Create New Article')
    click_on('Create New Article')
    expect(current_path).to eq(new_article_path)
    fill_in "article[title]", with: "New Title!"
    fill_in "article[body]",  with: "New Body!"

    click_on('Create Article')
    
    expect(page).to have_content('New Title')
    expect(page).to have_content('New Body')
  end
end
