require 'rails_helper'

RSpec.feature 'Homepage', type: :feature, js: true do
  let(:min) { Lunch::Grouper::DEFAULT_MIN }

  scenario 'User generates lunch groups' do
    names = []

    # first test out the negative
    ((min * 2) - 1).times.each do
      name = Faker::Name.name
      create_user(name)
      names << name
    end

    visit root_path

    click_on 'Generate lunch groups'

    wait_for_ajax

    expect(find('.api-response-message')).to have_text("Requires at least #{min * 2} users. Please add more users.")

    # now add one more user
    name = Faker::Name.name
    create_user(name)
    names << name

    visit root_path

    click_on 'Generate lunch groups'

    wait_for_ajax

    actual_names = find('.groups').all('li').map(&:text)
    expect(actual_names).to match_array(names)
  end

  def create_user(name)
    visit new_user_path

    fill_in 'Enter name', with: name
    click_on 'Add'

    wait_for_ajax

    expect(find('.api-response-message')).to have_text("User (#{name}) created!")
  end
end
