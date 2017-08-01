require 'rails_helper'

describe UsersController do
  describe 'GET #new' do
    subject { get :new }

    it 'renders new.slim' do
      subject

      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end
end
