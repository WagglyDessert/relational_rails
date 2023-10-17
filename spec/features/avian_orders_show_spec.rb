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
  #User Story 10, Parent Child Index Link
  #As a visitor
  #When I visit a parent show page ('/parents/:id')
  #Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
  it "has a link to the parent's bird_table_name page" do
   visit "/avianorders/#{@avianorder_1.id}"
    click_link("List of Birds in #{@avianorder_1.order}")
    expect(current_path).to eq("/avianorders/#{@avianorder_1.id}/birds")

    visit "/avianorders/#{@avianorder_2.id}"
    click_link("List of Birds in #{@avianorder_2.order}")
    expect(current_path).to eq("/avianorders/#{@avianorder_2.id}/birds")
  end
  # User Story 12, Parent Update 
  # As a visitor
  # When I visit a parent show page
  # Then I see a link to update the parent "Update Parent"
  # When I click the link "Update Parent"
  # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/parents/:id',
  # the parent's info is updated,
  # and I am redirected to the Parent's Show page where I see the parent's updated info
  it "adds a link to update parent record and creates a form" do
    visit "/avianorders/#{@avianorder_1.id}"
    expect(page).to have_link("Update Avian Order")

    click_link("Update Avian Order")
    expect(current_path).to eq("/avianorders/#{@avianorder_1.id}/edit")
    
    fill_in('Order', with: "Piciformes")
    click_button("Update Avian Order")
    expect(current_path).to eq("/avianorders")
    expect(page).to have_content("Piciformes")
    expect(page).to have_content("strigiformes")
    expect(page).to_not have_content("passeriformes")
  end
  # User Story 19, Parent Delete 
  # As a visitor
  # When I visit a parent show page
  # Then I see a link to delete the parent
  # When I click the link "Delete Parent"
  # Then a 'DELETE' request is sent to '/parents/:id',
  # the parent is deleted, and all child records are deleted
  # and I am redirected to the parent index page where I no longer see this parent
  it "will add a link to delete avianorder from avianorder show page" do
    visit "/avianorders/#{@avianorder_1.id}"
    expect(page).to have_link("Delete Avian Order")

    click_link("Delete Avian Order")
    expect(current_path).to eq("/avianorders")
    
    expect(page).to have_content("strigiformes")
    expect(page).to_not have_content("passeriformes")
  end
end