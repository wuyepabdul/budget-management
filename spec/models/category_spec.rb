require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category validation tests' do
    subject do
      @user = User.new(name: 'Abdul', email: 'abdul@mail.com', password: '123456', confirmed_at: Time.now)

      @category = @user.categories.new(user_id: @user.id, name: 'Shop Rite',
                                       icon: Rack::Test::UploadedFile.new('spec/support/test_image.jpeg', 'image/jpg'))
    end
    before { subject.save }

    it 'Category name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it ' should be integer' do
      subject.name = 'Shop Rite'
      expect(subject).to be_valid
    end
  end
end
