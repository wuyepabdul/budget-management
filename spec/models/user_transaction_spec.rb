require 'rails_helper'

RSpec.describe UserTransaction, type: :model do
  describe 'User Transaction validation tests' do
    subject do
      @file_upload = Rack::Test::UploadedFile.new('spec/support/test_image.jpeg', 'image/jpg')
      @user = User.new(name: 'Abdul', email: 'abdul@mail.com', password: '123456', confirmed_at: Time.now)

      @category = Category.new(name: 'Shop Rite',
                               icon: @file_upload, user_id: @user.id)
      @user_transaction = @user.user_transactions.new(name: 'Shawarma', amount: 20, category_lists: ['', @category.id],
                                                      user_id: @user.id)
    end
    before { subject.save }

    it 'User Transaction name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Transaction name should be valid' do
      subject.name = 'Shop Rite'
      expect(subject).to be_valid
    end
    it 'Transaction Amount should invalid' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
    it 'Transaction Amount should be valid' do
      subject.amount = 20
      expect(subject).to be_valid
    end
  end
end
