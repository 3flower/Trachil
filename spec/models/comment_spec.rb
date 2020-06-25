require 'rails_helper'
RSpec.describe Comment, type: :model do
  let!(:user){create(:user)}
  let!(:travel){create(:travel, user:user)}
  context "データが正しく保存される" do
    before do
        @comment = Comment.new
        @comment.travel = travel
        @comment.user = user
        @comment.travel_comment = "テストコメント"
        @comment.save
    end
    it "全て入力してあるので保存される" do
        expect(@comment).to be_valid
    end
  end
  context '紐づいてる？' do
    it 'N:1となっている' do
      expect(Comment.reflect_on_association(:travel).macro).to eq :belongs_to
    end
    it 'N:1となっている' do
      expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end
end
