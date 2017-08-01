require 'rails_helper'

describe Api::LunchGroupsController do
  describe 'GET #index' do
    subject { get :index }

    before { user_count.times { User.create!(name: Faker::Name.name) } }

    let(:user_count) { Lunch::Grouper::DEFAULT_MIN * 2 }

    it 'returns lunch groups' do
      subject

      expect(response).to be_success

      groups = JSON.parse(response.body).with_indifferent_access[:groups]

      expect(groups.flatten).to match_array(User.pluck(:name))

      groups.each do |group|
        expect(group).to be_an(Array)
        expect(group.count).to be >= Lunch::Grouper::DEFAULT_MIN
        expect(group.count).to be <= Lunch::Grouper::DEFAULT_MAX
      end
    end

    context 'when there is not enough users in the db' do
      let(:user_count) { (Lunch::Grouper::DEFAULT_MIN * 2) - 1 }

      it 'returns 422' do
        subject

        expect(response).to have_http_status(:unprocessable_entity)

        message = JSON.parse(response.body).with_indifferent_access[:message]

        expect(message).to eq("Requires at least #{Lunch::Grouper::DEFAULT_MIN * 2} users. Please add more users.")
      end
    end
  end
end
