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
    @avianorder_2 = AvianOrder.create!(order: "strigiformes",
        families: "Strigidae, Tytonidae",
        species: 225,
        anisodactyl: false,
        zygodactyl: true,
        tridactyl: false,
        didactyl: false)
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
        #save_and_open_page if not using seed data
        expect(page).to have_content("Avianorders")
        expect(page).to have_content(avianorder_1.families)
        expect(page).to have_content(avianorder_1.anisodactyl)
      end
      #User Story 6, Parent Index sorted by Most Recently Created
      it "I can see each avianorder ordered by date of creation" do
        visit "/avianorders"
      # I see that records are ordered by most recently created first
      # And next to each of the records I see when it was created
        expect(@avianorder_2.order).to appear_before(@avianorder_1.order)
        expect(page).to have_content(@avianorder_1.created_at)
        expect(page).to have_content(@avianorder_2.created_at)
      end
    end
  end
end