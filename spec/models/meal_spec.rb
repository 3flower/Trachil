require 'rails_helper'
RSpec.describe Meal, type: :model do
  let!(:user){create(:user)}
  let!(:travel){create(:travel, user:user)}
  let!(:category){create(:category, travel:travel)}
  context "データが正しく保存される" do
    before do
        @meal = Meal.new
        @meal.travel = category.travel
        @meal.shop_name = "テスト店"
        @meal.address = "大阪"
        @meal.adult_price = 2500
        @meal.child_price = 0
        @meal.impression = "楽しかった"
        @meal.is_baby_food_place = true
        @meal.parking = "あり"
        @meal.official_site = "https://myhyles.work/"
        @meal.save
    end
    it "全て入力してあるので保存される" do
        expect(@meal).to be_valid
    end
    it "空の投稿ができない" do
      @meal.shop_name = nil
      expect(@meal).not_to be_valid
    end
    it "空の投稿ができない" do
      @meal.address = nil
      expect(@meal).not_to be_valid
    end
    it "空の投稿ができない" do
      @meal.adult_price = nil
      expect(@meal).not_to be_valid
    end
    it "空の投稿ができない" do
      @meal.child_price = nil
      expect(@meal).not_to be_valid
    end
    it "空の投稿ができない" do
      @meal.impression = nil
      expect(@meal).not_to be_valid
    end
    it "空の投稿ができない" do
      @meal.parking = nil
      expect(@meal).not_to be_valid
    end
    it "1000文字以上の投稿ができない" do
      @meal.impression = "a"*1001
      expect(@meal).not_to be_valid
    end
    it "半角数字以外の投稿ができない" do
      @meal.adult_price = "１"
      expect(@meal).not_to be_valid
    end
    it "半角数字以外の投稿ができない" do
      @meal.child_price = "１"
      expect(@meal).not_to be_valid
    end
  end
  context '紐づいてる？' do
    it 'N:1となっている' do
      expect(Meal.reflect_on_association(:travel).macro).to eq :belongs_to
    end
  end
end
