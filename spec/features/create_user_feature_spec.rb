require 'rails_helper'

RSpec.feature 'Create user page', type: :feature, js: true do
  let(:name) { Faker::Name.name }

  scenario 'creating a user' do
    visit new_user_path

    fill_in 'Enter name', with: name
    click_on 'Add'

    wait_for_ajax

    expect(find('.api-response-message')).to have_text("User (#{name}) created!")

    expect(User.count).to eq(1)
    expect(User.last.name).to eq(name)

    # clicking on Add button again will trigger error
    click_on 'Add'

    wait_for_ajax

    expect(find('.api-response-message')).to have_text("User with name, #{name}, already exists!")
  end
end
