require 'rails_helper'

RSpec.feature "Visitor clicks product partials and goes to the new page", type: :feature, js: true do

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

  scenario "They see a product" do
    # ACT
    visit root_path

    find('a.btn-default').click

    expect(page).to have_content('Description')

    # commented out b/c it's for debugging only
    # save_and_open_screenshot

  end

end