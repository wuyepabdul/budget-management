require 'rails_helper'

RSpec.feature 'Category index', type: :feature do
  background do
    visit new_user_session_path
    @file_upload = Rack::Test::UploadedFile.new('spec/support/test_image.jpeg', 'image/jpg')

    @user = User.create!(name: 'abdul', email: 'abdul@mail.com', password: '123456', confirmed_at: Time.now)

    @category = Category.create!(name: 'Shop Rite',
                                 icon: @file_upload, user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit categories_path
  end

  scenario 'Display User Categories on page' do
    expect(page).to have_content('Shop Rite')
  end

  scenario 'display Add category button on page' do
    expect(page).to have_link 'Add a new category'
  end

  scenario 'display a view button' do
    expect(page).to have_link 'View'
  end

  scenario 'When I click on view, I am redirected to category\'s transactions\'s page.' do
    click_link('View')
    expect(page).to have_current_path category_user_transactions_path(@category.id)
  end
end
