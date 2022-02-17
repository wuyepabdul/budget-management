require 'rails_helper'

RSpec.describe CategoriesController, type: :routing do
  describe 'category routing' do
    it 'categories index route' do
      expect(get: '/categories').to route_to('categories#index')
    end

    it 'new categories routes' do
      expect(get: '/categories/new').to route_to('categories#new')
    end

    it 'create categorie routes' do
      expect(post: '/categories').to route_to('categories#create')
    end

    it 'destroy categorie routes' do
      expect(delete: '/categories/1').to route_to('categories#destroy', id: '1')
    end
  end
end
