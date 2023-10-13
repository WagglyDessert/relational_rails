require "rails_helper"

RSpec.describe "AvianOrders Index", type: :feature do

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
    end
  end
end