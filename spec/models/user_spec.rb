require 'rails_helper'
RSpec.describe User, type: :model do

  context "データが正しく保存される" do
    before do
        @user = User.new
        @user.name = "あつき"
        @user.introduction = "自己紹介"
        @user.email = "testtest@test.com"
        @user.password = "123456"
        @user.residence = "大阪"
        @user.is_child = true
        @user.child_people = 1
        @user.child_age = 1
        @user.is_diaper = true
        @user.is_baby_food = true
        @user.user_image_id = (File.join(Rails.root, 'spec/fixtures/default.png'))
        @user.is_valid = true
        @user.save
    end
    it "全て入力してあるので保存される" do
        expect(@user).to be_valid
    end
    it "空の投稿ができない" do
      @user.name = nil
      expect(@user).not_to be_valid
    end
    it "空の投稿ができない" do
      @user.child_people, = nil
      expect(@user).not_to be_valid
    end
    it "空の投稿ができない" do
      @user.child_age, = nil
      expect(@user).not_to be_valid
    end
    it "251文字以上の投稿ができない" do
      @user.introduction =  "a"*251
      expect(@user).not_to be_valid
    end
  end
  context '紐づいてる？' do
    it '1:Nとなっている' do
      expect(User.reflect_on_association(:travels).macro).to eq :has_many
    end
    it '1:Nとなっている' do
      expect(User.reflect_on_association(:comments).macro).to eq :has_many
    end
    it '1:Nとなっている' do
      expect(User.reflect_on_association(:likes).macro).to eq :has_many
    end
    it '1:Nとなっている' do
      expect(User.reflect_on_association(:relationships).macro).to eq :has_many
    end
  end
end
