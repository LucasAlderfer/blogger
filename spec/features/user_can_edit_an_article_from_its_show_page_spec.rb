require "rails_helper"

describe "user can edit an article" do
  describe 'by clicking a link from the show page for the article' do
    describe 'by filling in the title and body' do
      it 'edits the article' do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")
        article_2 = Article.create!(title: "Title 2", body: "Body 2")

        visit articles_path

        click_link "#{article_1.title}"

        expect(current_path).to eq(article_path(article_1))

        click_link "Edit"

        expect(current_path).to eq("#{article_path(article_1)}/edit")

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]", with: "New Body!"
        click_on "Update Article"

        expect(current_path).to eq(article_path(article_1))
        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
      end
    end
  end
end
