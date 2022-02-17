require 'rails_helper'
RSpec.describe 'Home Page', type: :feature do
    # before do
    #     book = Book.create(title:'The Lord of the Rings', author:'Tolkien')
    #     visit '/'
    # end

    it 'Displays home page and nav bar' do
        expect(page).to have_content('Home Page')
        # expect(page).to have_text('Tolkien')
        # expect(page).to have_link('New Book')
    end
end