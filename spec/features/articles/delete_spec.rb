require 'rails_helper'

RSpec.describe 'An article can be deleted', type: :feature do
  before(:each) do
    @foxy_article = Article.create!(title: 'Foxy', body: 'This is all about foxy!')
    @mrjingles_article = Article.create!(title: 'Mr.Jingles', body: 'This is all about Mr.Jingles')
  end

  it 'article destroyed' do
    visit article_path(@foxy_article)
    click_on('Delete')

    expect(current_path).to eq(articles_path)
    expect(page).to have_content(@mrjingles_article.title)
    expect(page).to_not have_content(@foxy_article.title)
  end
end
