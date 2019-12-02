require 'rails_helper'

RSpec.describe 'user sees one article', type: :feature do
  before(:each) do
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
  end
  describe 'they link from the articles index' do
    it 'displays information for one article' do
      visits articles_path
      # visits '/articles'

      click_link @article_1.title

      expect(current_path).to eq("/articles/#{@article_1.id}")
      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_1.body)
    end
  end
end
