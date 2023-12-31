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
        expect(page).to have_content("Avian Orders")
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
      # User Story 9, Parent Index Link
      # As a visitor
      #When I visit any page on the site
      #Then I see a link at the top of the page that takes me to the Parent Index
      it "adds a link to the parent index" do
        visit "/birds"
        click_link('List of Birds')
        expect(current_path).to eq('/birds')

        visit "/avianorders"
        click_link('List of Birds')
        expect(current_path).to eq('/birds')
      end
    # User Story 11, Parent Creation 
    # As a visitor
    # When I visit the Parent Index page
    # Then I see a link to create a new Parent record, "New Parent"
    # When I click this link
    # Then I am taken to '/parents/new' where I  see a form for a new parent record
    # When I fill out the form with a new parent's attributes:
    # And I click the button "Create Parent" to submit the form
    # Then a `POST` request is sent to the '/parents' route,
    # a new parent record is created,
    # and I am redirected to the Parent Index page where I see the new Parent displayed.
      it "adds a link to create a new parent record and creates a form" do
        visit "/avianorders"
        expect(page).to have_link("Add New Avian Order")

        click_link("Add New Avian Order")
        expect(current_path).to eq("/avianorders/new")
        
        fill_in('Order', with: "Piciformes")
        click_button("Create Avian Order")
        expect(current_path).to eq("/avianorders")
        expect(page).to have_content("Piciformes")
      end
      # User Story 17, Parent Update From Parent Index Page 
      # As a visitor
      # When I visit the parent index page
      # Next to every parent, I see a link to edit that parent's info
      # When I click the link
      # I should be taken to that parent's edit page where I can update its information just like in User Story 12
      it "link to update avianorder present from parent index page" do
        visit "/avianorders"
        expect(page).to have_link("Update Avian Order")

        all('a', text: "Update Avian Order")[0].click
        expect(current_path).to eq("/avianorders/#{@avianorder_2.id}/edit")
        
        fill_in('Order', with: "Piciformes")
        click_button("Update Avian Order")
        expect(current_path).to eq("/avianorders")
        expect(page).to have_content("Piciformes")
        expect(page).to have_content("passeriformes")
        expect(page).to_not have_content("strigiformes")
      end
      # User Story 22, Parent Delete From Parent Index Page 
      # As a visitor
      # When I visit the parent index page
      # Next to every parent, I see a link to delete that parent
      # When I click the link
      # I am returned to the Parent Index Page where I no longer see that parent
      it "has a button to delete avianorder from index page" do
        visit "/avianorders"
        expect(page).to have_button("Delete #{@avianorder_1.order}")
        expect(page).to have_button("Delete #{@avianorder_2.order}")

        click_button("Delete #{@avianorder_1.order}")
        expect(current_path).to eq("/avianorders")
        
        expect(page).to have_content("strigiformes")
        expect(page).to_not have_content("passeriformes")
      end
    end
  end
end