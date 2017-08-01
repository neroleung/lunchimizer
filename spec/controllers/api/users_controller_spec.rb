require 'rails_helper'

describe Api::UsersController do
  describe 'POST #create' do
    subject { post :create, params: params }

    let(:params) { {name: name} }
    let(:name) { Faker::Name.name }

    it 'creates a user' do
      expect { subject }.to change { User.count }.from(0).to(1)

      expect(User.first.name).to eq(name)
    end

    it 'returns success message' do
      subject

      expect(response).to be_success

      message = JSON.parse(response.body).with_indifferent_access[:message]
      expect(message).to eq("User (#{name}) created!")
    end

    context 'when name is not given' do
      let(:name) { ' ' }

      it 'does not create a user' do
        expect { subject }.to_not change { User.count }
      end

      it 'returns 422' do
        subject

        expect(response).to have_http_status(:unprocessable_entity)

        message = JSON.parse(response.body).with_indifferent_access[:message]
        expect(message).to eq('param is missing or the value is empty: name')
      end
    end

    context 'when name already exists in db' do
      before { User.create!(name: name) }

      it 'does not create a user' do
        expect { subject }.to_not change { User.count }
      end

      it 'returns 422' do
        subject

        expect(response).to have_http_status(:unprocessable_entity)

        message = JSON.parse(response.body).with_indifferent_access[:message]
        expect(message).to eq("User with name, #{name}, already exists!")
      end
    end
  end
end
