require "rails_helper"

RSpec.feature "Creating Articles" do
    scenario "A user creates a new article" do
        visit "/"
        
        click_link "New Article"
        
        fill_in "Title", with: "Creating a blog"
        fill_in "Body", with: "Lorem Ipsum"
        
        click_button "Create Article"
        
        expect(page).to have_content("Article has been create")
        expect(page.current_path).to eq(article_path)
    end
    
    scenario "A user fails to create a new article" do
        visit "/"
        
        click_link "New Article"
        
        fill_in "Title", with: ""
        fill_in "Body", with: ""
        
        click_button "Create Article"
        
        expect(page).to have_content("Article has not been create")
        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Body can't blank")
    end
end