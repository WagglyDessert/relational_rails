require "rails_helper"

RSpec.describe Bird, type: :model do
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
    @bird_1 = @avianorder_1.birds.create!(name: "Common starling",
                        population: 310000000,
                         migratory: true,
                         sexual_dichromatism: true)
    @bird_2 = @avianorder_1.birds.create!(name: "Eurasian bullfinch",
                         population: 40000000,
                          migratory: true,
                          sexual_dichromatism: true)
    @bird_3 = @avianorder_2.birds.create!(name: "Great horned owl",
                         population: 5700000,
                          migratory: false,
                          sexual_dichromatism: false)
    @bird_4 = @avianorder_2.birds.create!(name: "Eurasian eagle-owl",
                         population: 300000,
                          migratory: false,
                          sexual_dichromatism: false)
  end
  # User Story 15, Child Index only shows `true` Records 
  # As a visitor
  # When I visit the child index
  # Then I only see records where the boolean column is `true`
  describe "display_true" do
    it "only displays birds where the migratory column is true" do
      migratory_birds = Bird.display_true

      expect(migratory_birds).to eq([@bird_1, @bird_2])
    end
  end
end