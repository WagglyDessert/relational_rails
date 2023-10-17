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
    end
  end
end