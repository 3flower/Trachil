require 'rails_helper'
RSpec.describe Relationship, type: :model do
  let!(:user){create(:user)}
  let!(:other_user){create(:user)}
  context "データが正しく保存される" do
    before do
        @follow = Relationship.new
        @follow.user = user
        @follow.follow = other_user
        @follow.save
    end
    it "全て入力してあるので保存される" do
        expect(@follow).to be_valid
    end
    it "空の投稿ができない" do
      @follow.user = nil
      expect(@follow).not_to be_valid
    end
    it "空の投稿ができない" do
      @follow.follow = nil
      expect(@follow).not_to be_valid
    end
  end
  context '紐づいてる？' do
    it 'N:1となっている' do
      expect(Relationship.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end
end
