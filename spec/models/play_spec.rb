require 'rails_helper'
RSpec.describe Play, type: :model do
  let!(:user){create(:user)}
  let!(:travel){create(:travel, user:user)}
  let!(:category){create(:category, travel:travel)}
  context "データが正しく保存される" do
    before do
        @play = Play.new
        @play.travel = category.travel
        @play.name = "遊び"
        @play.address = "大阪"
        @play.adult_price = 2500
        @play.child_price = 0
        @play.impression = "楽しかった"
        @play.is_diaper_place = true
        @play.parking = "あり"
        @play.official_site = "https://myhyles.work/"
        @play.save
    end
    it "全て入力してあるので保存される" do
        expect(@play).to be_valid
    end
    it "空の投稿ができない" do
      @play.name = nil
      expect(@play).not_to be_valid
    end
    it "空の投稿ができない" do
      @play.address = nil
      expect(@play).not_to be_valid
    end
    it "空の投稿ができない" do
      @play.adult_price = nil
      expect(@play).not_to be_valid
    end
    it "空の投稿ができない" do
      @play.child_price = nil
      expect(@play).not_to be_valid
    end
    it "空の投稿ができない" do
      @play.impression = nil
      expect(@play).not_to be_valid
    end
    it "空の投稿ができない" do
      @play.parking = nil
      expect(@play).not_to be_valid
    end
    it "1000文字以上の投稿ができない" do
      @play.impression = "a"*1001
      expect(@play).not_to be_valid
    end
    it "半角数字以外の投稿ができない" do
      @play.adult_price = "１"
      expect(@play).not_to be_valid
    end
    it "半角数字以外の投稿ができない" do
      @play.child_price = "１"
      expect(@play).not_to be_valid
    end
  end
  context '紐づいてる？' do
    it 'N:1となっている' do
      expect(Play.reflect_on_association(:travel).macro).to eq :belongs_to
    end
  end
end
