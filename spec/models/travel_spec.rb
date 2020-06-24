require 'rails_helper'
RSpec.describe Travel, type: :model do
  let!(:user){create(:user)}
  context "データが正しく保存される" do
    before do
        @travel = Travel.new
        @travel.user = user
        @travel.title = "テストタイトル"
        @travel.travel_day = Date.parse("2020-6-24")
        @travel.traffic_way = "車"
        @travel.recommend_age = 3
        @travel.evaluation = 5.0
        @travel.is_display = true
        @travel.save
    end
    it "全て入力してあるので保存される" do
        expect(@travel).to be_valid
    end
    it "空の投稿ができない" do
      @travel.title = nil
      expect(@travel).not_to be_valid
    end
    it "空の投稿ができない" do
      @travel.travel_day = nil
      expect(@travel).not_to be_valid
    end
    it "空の投稿ができない" do
      @travel.traffic_way = nil
      expect(@travel).not_to be_valid
    end
    it "空の投稿ができない" do
      @travel.recommend_age = nil
      expect(@travel).not_to be_valid
    end
    it "空の投稿ができない" do
      @travel.evaluation = nil
      expect(@travel).not_to be_valid
    end
    it "88文字以上の投稿ができない" do
      @travel.title = "a"*88
      expect(@travel).not_to be_valid
    end
    it "半角数字以外の投稿ができない" do
      @travel.recommend_age = "１"
      expect(@travel).not_to be_valid
    end
  end
  context '紐づいてる？' do
    it '1:Nとなっている' do
      expect(Travel.reflect_on_association(:travel_images).macro).to eq :has_many
    end
    it '1:Nとなっている' do
      expect(Travel.reflect_on_association(:comments).macro).to eq :has_many
    end
    it '1:Nとなっている' do
      expect(Travel.reflect_on_association(:likes).macro).to eq :has_many
    end
    it 'N:1となっている' do
      expect(Travel.reflect_on_association(:user).macro).to eq :belongs_to
    end
    it '1:1となっている' do
      expect(Travel.reflect_on_association(:category).macro).to eq :has_one
    end
    it '1:1となっている' do
      expect(Travel.reflect_on_association(:play).macro).to eq :has_one
    end
    it '1:1となっている' do
      expect(Travel.reflect_on_association(:hotel).macro).to eq :has_one
    end
    it '1:1となっている' do
      expect(Travel.reflect_on_association(:meal).macro).to eq :has_one
    end
  end
end
