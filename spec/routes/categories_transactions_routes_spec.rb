require 'rails_helper'

RSpec.describe UserTransactionsController, type: :routing do
  describe 'user transactions routing' do
    it 'user transactions index route' do
      expect(get: 'categories/1/user_transactions').to route_to('user_transactions#index', category_id: '1')
    end

    it 'new user transactions routes' do
      expect(get: 'categories/1/user_transactions/new').to route_to('user_transactions#new', category_id: '1')
    end

    it 'create user transactions route' do
      expect(post: 'categories/1/user_transactions').to route_to('user_transactions#create', category_id: '1')
    end
  end
end
