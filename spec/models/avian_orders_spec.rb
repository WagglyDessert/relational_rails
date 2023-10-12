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
        avianorder_2 = AvianOrder.create!(order: "strigiformes",
        families: "Strigidae, Tytonidae",
        species: 225,
        anisodactyl: false,
        zygodactyl: true,
        tridactyl: false,
        didactyl: false)
        #act
        visit "/avianorders"
        #assert
        #save_and_open_page
        expect(page).to have_content("Avianorders")
        expect(page).to have_content(avianorder_1.families)
        expect(page).to have_content(avianorder_1.anisodactyl)
      end
    end
  end
end