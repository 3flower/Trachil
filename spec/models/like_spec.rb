require 'rails_helper'
RSpec.describe Like, type: :model do
  let!(:user){create(:user)}
  let!(:travel){create(:travel, user:user)}
  context "データが正しく保存される" do
    before do
        @like = Like.new
        @like.travel = travel
        @like.user = user
        @like.save
    end
    it "全て入力してあるので保存される" do
        expect(@like).to be_valid
    end
  end
  context '紐づいてる？' do
    it 'N:1となっている' do
      expect(Like.reflect_on_association(:travel).macro).to eq :belongs_to
    end
    it 'N:1となっている' do
      expect(Like.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end
end
