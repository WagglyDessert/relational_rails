require 'rails_helper'

RSpec.describe "avian_order_birds index", type: :feature do
  describe 'parent-child index' do
    it 'displays children associated with the parent' do
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

      visit "/avianorders/#{avianorder_1.id}/birds"
      
      expect(page).to have_content(bird_1.name)
      expect(page).to have_content(bird_1.population)
      expect(page).to have_content(bird_1.migratory)
      expect(page).to have_content(bird_1.sexual_dichromatism)
      end
  end
end