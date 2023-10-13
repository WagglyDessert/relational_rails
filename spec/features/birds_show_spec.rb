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
        bird_1 = avianorder_1.birds.create!(name: "Common starling",
                        population: 310000000,
                         migratory: true,
                         sexual_dichromatism: true)
    visit "/birds/#{bird_1.id}"
    expect(page).to have_content(bird_1.id)
    expect(page).to have_content(bird_1.name)
    expect(page).to have_content(bird_1.population)
    expect(page).to have_content(bird_1.avian_order.order)
  end
end