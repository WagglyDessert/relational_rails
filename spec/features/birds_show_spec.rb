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
  # User Story 14, Child Update 
  # As a visitor
  # When I visit a Child Show page
  # Then I see a link to update that Child "Update Child"
  # When I click the link
  # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information
  it "adds a link to update child record and creates a form" do
    visit "/birds/#{@bird_1.id}"
    expect(page).to have_link("Update Bird")

    click_link("Update Bird")
    expect(current_path).to eq("/birds/#{@bird_1.id}/edit")
    
    fill_in('name', with: "Yellow-bellied front-runner")
    click_button("Update Bird")
    expect(current_path).to eq("/birds")
    expect(page).to have_content("Yellow-bellied front-runner")
    expect(page).to_not have_content("Common starling")
  end
end