require 'rails_helper'

describe HomeController do
  describe 'GET #index' do
    subject { get :index }

    it 'renders index.slim' do
      subject

      expect(response).to be_success
      expect(response).to render_template(:index)
    end
  end
end
