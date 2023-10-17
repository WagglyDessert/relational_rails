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
  # When I visit '/avianorders/:id'
  # I see the avianorder with that id including its attributes
  it "I can see avianorders's id" do
    avianorder_1 = AvianOrder.create!(order: "passeriformes",
              families: "Muscicapoidea, Fringillidae, Troglodytidae",
               species: 6500,
               anisodactyl: true,
               zygodactyl: false,
               tridactyl: false,
               didactyl: false)
    visit "/avianorders/#{avianorder_1.id}"
    expect(page).to have_content(avianorder_1.id)
    expect(page).to have_content(avianorder_1.families)
    expect(page).to have_content(avianorder_1.anisodactyl)
  end
  # User Story 7, Parent Child Count
  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  it "shows a count of the number of children associated with this parent" do
    visit "/avianorders/#{@avianorder_1.id}"
    expect(page).to have_content(@avianorder_1.birds.count)
  end
end