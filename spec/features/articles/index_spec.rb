require 'rails_helper'

RSpec.describe 'user sees all articles', type: :feature do
  describe 'they visit /articles' do
    before(:each) do
      @article_1 = Article.create!(title: "Title 1", body: "Body 1")
      @article_2 = Article.create!(title: "Title 2", body: "Body 2")
    end

    it 'displays all articles' do
      visit '/articles'

      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_2.title)

      expect(page).to have_link(@article_1.title)
      expect(page).to have_link(@article_2.title)
      expect(page).to have_link('Create New Article')
    end
  end
end
