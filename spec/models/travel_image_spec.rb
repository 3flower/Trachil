require 'rails_helper'
RSpec.describe TravelImage, type: :model do
  let!(:user){create(:user)}
  let!(:travel){create(:travel, user:user)}
  context "データが正しく保存される" do
    before do
        @image = TravelImage.new
        @image.travel = travel
        @image.image_url = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default.png'))
        @image.save
    end
    it "全て入力してあるので保存される" do
        expect(@image).to be_valid
    end
    it "空の投稿ができない" do
      @image.image_url = nil
      expect(@image).not_to be_valid
    end
  end
  context '紐づいてる？' do
    it '1:Nとなっている' do
      expect(TravelImage.reflect_on_association(:travel).macro).to eq :belongs_to
    end
  end
end
