require "rails_helper"

RSpec.describe "AvianOrders Index", type: :feature do

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
end