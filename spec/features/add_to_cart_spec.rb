require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
   # SETUP
  before :each do
      @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

scenario "The cart updates" do
    # ACT
    visit root_path
    
    expect(page).to have_content('My Cart (0)')

    find('button.btn-primary').click
    
    expect(page).to have_content('My Cart (1)')
    # commented out b/c it's for debugging only
    # save_and_open_screenshot

  end

end
