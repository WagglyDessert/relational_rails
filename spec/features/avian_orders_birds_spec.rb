require 'rails_helper'

RSpec.describe "avian_order_birds index", type: :feature do
  before :each do
    @avianorder_1 = AvianOrder.create!(order: "passeriformes",
                        families: "Muscicapoidea, Fringillidae, Troglodytidae",
                         species: 6500,
                         anisodactyl: true,
                         zygodactyl: false,
                         tridactyl: false,
                         didactyl: false)
    @bird_1 = @avianorder_1.birds.create!(name: "Common starling",
                        population: 310000000,
                         migratory: true,
                         sexual_dichromatism: true)
    @bird_2 = @avianorder_1.birds.create!(name: "Eurasian bullfinch",
                         population: 40000000,
                          migratory: true,
                          sexual_dichromatism: true)
  end
  describe 'parent-child index' do
    it 'displays children associated with the parent' do
      avianorder_1 = AvianOrder.create!(order: "passeriformes",
                        families: "Muscicapoidea, Fringillidae, Troglodytidae",
                         species: 6500,
                         anisodactyl: true,
                         zygodactyl: false,
                         tridactyl: false,
                         didactyl: false)
      bird_1 = avianorder_1.birds.create!(name: "Common starling",
                        population: 310000000,
                         migratory: true,
                         sexual_dichromatism: true)

      visit "/avianorders/#{avianorder_1.id}/birds"
      
      expect(page).to have_content(bird_1.name)
      expect(page).to have_content(bird_1.population)
      expect(page).to have_content(bird_1.migratory)
      expect(page).to have_content(bird_1.sexual_dichromatism)
    end
    # User Story 13, Parent Child Creation 
    # As a visitor
    # When I visit a Parent Children Index page
    # Then I see a link to add a new adoptable child for that parent "Create Child"
    # When I click the link
    # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
    # When I fill in the form with the child's attributes:
    # And I click the button "Create Child"
    # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
    # a new child object/row is created for that parent,
    # and I am redirected to the Parent Childs Index page where I can see the new child listed
    it "adds a link to create a bird via a form" do
      visit "/avianorders/#{@avianorder_1.id}/birds"
        expect(page).to have_link("Add New Bird")

        click_link("Add New Bird")
        expect(current_path).to eq("/avianorders/#{@avianorder_1.id}/birds/new")
        
        fill_in('name', with: "Spotted toucan")
        click_button("Create Bird")
        expect(current_path).to eq("/avianorders/#{@avianorder_1.id}/birds")
        expect(page).to have_content("Spotted toucan")
    end
    # User Story 16, Sort Parent's Children in Alphabetical Order by name 
    # As a visitor
    # When I visit the Parent's children Index Page
    # Then I see a link to sort children in alphabetical order
    # When I click on the link
    # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
    it "shows a link to sort birds in alphabetical order" do
      visit "/avianorders/#{@avianorder_1.id}/birds"
      expect(page).to have_link("Sort Alphabetically")

      click_link("Sort Alphabetically")
      expect("Common starling").to appear_before("Eurasian bullfinch")
    end
    # User Story 21, Display Records Over a Given Threshold 
    # As a visitor
    # When I visit the Parent's children Index Page
    # I see a form that allows me to input a number value
    # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
    # Then I am brought back to the current index page with only the records that meet that threshold shown.
    it "shows a form to input a number value and returns only those records with more than that number" do
      visit "/avianorders/#{@avianorder_1.id}/birds"
      expect(page).to have_selector('form', text: "Only return birds with a populaton greater than:")
      expect(page).to have_button("Filter")

      fill_in "filter", with: 40000000
      click_button "Filter"

      expect(page).to have_content("Common starling")
      expect(page).to_not have_content("Eurasian bullfinch")
    end
  end
end