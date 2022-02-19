# require 'rails_helper'

RSpec.feature 'Category index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create!(name: 'abdul', email: 'abdul@mail.com', password: '123456', confirmed_at: Time.now)

    file = Rack::Test::UploadedFile.new('spec/support/test_image.jpeg', 'image/jpg')

    @category = Category.create!(name: 'Shop Rite',
                                 icon: file, user_id: @user.id)

    @user_transaction = UserTransaction.create(name: 'Shawarma', amount: 20, category_lists: ['', @category.id],
                                               user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit category_user_transactions_path(@category.id)
  end

  scenario 'Display User Category Transaction page' do
    expect(page).to have_content('Shawarma')
  end

  scenario 'Display User Category Transaction page' do
    expect(page).to have_content("$#{@user_transaction.amount}")
  end

  scenario 'display Add category button on page' do
    expect(page).to have_link 'Add a new transaction'
  end

  scenario 'display a view button' do
    expect(page).to have_link '< Back'
  end

  scenario 'When I click on Back button, I am redirected to category\'s index page.' do
    click_link('< Back')
    expect(page).to have_current_path categories_path
  end
end
