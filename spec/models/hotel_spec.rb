require 'rails_helper'
RSpec.describe Hotel, type: :model do
  let!(:user){create(:user)}
  let!(:travel){create(:travel, user:user)}
  let!(:category){create(:category, travel:travel)}
  context "データが正しく保存される" do
    before do
        @hotel = Hotel.new
        @hotel.travel = category.travel
        @hotel.hotel_name = "テストホテル"
        @hotel.address = "大阪"
        @hotel.adult_price = 2500
        @hotel.child_price = 0
        @hotel.impression = "楽しかった"
        @hotel.parking = "あり"
        @hotel.official_site = "https://myhyles.work/"
        @hotel.save
    end
    it "全て入力してあるので保存される" do
        expect(@hotel).to be_valid
    end
    it "空の投稿ができない" do
      @hotel.hotel_name = nil
      expect(@hotel).not_to be_valid
    end
    it "空の投稿ができない" do
      @hotel.address = nil
      expect(@hotel).not_to be_valid
    end
    it "空の投稿ができない" do
      @hotel.adult_price = nil
      expect(@hotel).not_to be_valid
    end
    it "空の投稿ができない" do
      @hotel.child_price = nil
      expect(@hotel).not_to be_valid
    end
    it "空の投稿ができない" do
      @hotel.impression = nil
      expect(@hotel).not_to be_valid
    end
    it "空の投稿ができない" do
      @hotel.parking = nil
      expect(@hotel).not_to be_valid
    end
    it "1000文字以上の投稿ができない" do
      @hotel.impression = "a"*1001
      expect(@hotel).not_to be_valid
    end
    it "半角数字以外の投稿ができない" do
      @hotel.adult_price = "１"
      expect(@hotel).not_to be_valid
    end
    it "半角数字以外の投稿ができない" do
      @hotel.child_price = "１"
      expect(@hotel).not_to be_valid
    end
  end
  context '紐づいてる？' do
    it 'N:1となっている' do
      expect(Hotel.reflect_on_association(:travel).macro).to eq :belongs_to
    end
  end
end
