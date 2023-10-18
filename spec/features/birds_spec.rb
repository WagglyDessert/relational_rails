require "rails_helper"

RSpec.describe "AvianOrders Index", type: :feature do
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

  # As a user,
  # When I visit '/avianorders'
  # I see each avianorders's families, species, and toe formation
  describe "As a user" do
    describe "when I visit '/avianorders" do
      it "I can see each avianorders's families, species, and toe formation" do
        #arrange
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
        #act
        visit "/birds"
        #assert
        #save_and_open_page if not using seed data
        expect(page).to have_content("Birds")
        expect(page).to have_content(bird_1.name)
        expect(page).to have_content(bird_1.population)
      end
      # User Story 8, Child Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Child Index
      it "will add a link to birds index from any page on the site" do
        visit "/birds"
        click_link('List of Birds')
        expect(current_path).to eq('/birds')

        visit "/avianorders"
        click_link('List of Birds')
        expect(current_path).to eq('/birds')
      end
      # User Story 18, Child Update From Childs Index Page 
      # As a visitor
      # When I visit the `child_table_name` index page or a parent `child_table_name` index page
      # Next to every child, I see a link to edit that child's info
      # When I click the link
      # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14
      it "has links to update birds from bird index page" do
        visit "/birds"
        expect(page).to have_link("Update Bird")

        all('a', text: "Update Bird")[0].click
        expect(current_path).to eq("/birds/#{@bird_1.id}/edit")
        
        fill_in('name', with: "Yellow-bellied front-runner")
        click_button("Update Bird")
        expect(current_path).to eq("/birds")
        expect(page).to have_content("Yellow-bellied front-runner")
        expect(page).to_not have_content("Common starling")
      end
      # User Story 23, Child Delete From Childs Index Page 
      # As a visitor
      # When I visit the `child_table_name` index page or a parent `child_table_name` index page
      # Next to every child, I see a link to delete that child
      # When I click the link
      # I should be taken to the `child_table_name` index page where I no longer see that child
      it "has a button to delete bird from bird index page" do
        visit "/birds"
        expect(page).to have_button("Delete #{@bird_1.name}")
        expect(page).to have_button("Delete #{@bird_2.name}")

        click_button("Delete #{@bird_1.name}")
        expect(current_path).to eq("/birds")
        
        expect(page).to have_content("Eurasian bullfinch")
        expect(page).to_not have_content("Common starling")
      end
    end
  end
end