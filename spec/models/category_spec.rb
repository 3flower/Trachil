require 'rails_helper'
RSpec.describe Category, type: :model do
  let!(:user){create(:user)}
  let!(:travel){create(:travel, user:user)}
  context "データが正しく保存される" do
    before do
        @category = Category.new
        @category.travel = travel
        @category.is_play = true
        @category.is_hotel = true
        @category.is_meal = true
        @category.save
    end
    it "全て入力してあるので保存される" do
        expect(@category).to be_valid
    end
  end
  context '紐づいてる？' do
    it 'N:1となっている' do
      expect(Category.reflect_on_association(:travel).macro).to eq :belongs_to
    end
  end
end
