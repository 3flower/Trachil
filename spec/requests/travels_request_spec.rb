require 'rails_helper'
RSpec.describe "Travel", type: :request do
  let!(:user){create(:user)}
  let!(:travel){create(:travel, user: user)}
  before do
    sign_in user
  end
  it '一覧画面に遷移する' do
    get travels_path
    expect(response.status).to eq 302
  end
  it '投稿画面に遷移する' do
    get new_travel_path
    expect(response.status).to eq 302
  end
  it '編集画面に遷移する' do
    get edit_travel_path(travel)
    expect(response.status).to eq 302
  end
  it '詳細画面に遷移する' do
    get travel_path(travel)
    expect(response.status).to eq 302
  end

  # it '投稿' do
  #   expect{
  #       post travels_path, params: { travel: {title: "test", traffic_way: "車", travel_day: Date.parse("2020-6-24"), recommend_age: 1, evaluation: 5.0, is_display: true}}
  #     }.to change(Travel, :count).by(1)
  #   expect{
  #       post travels_path, params: { play: {name: "test", address: "大阪", adult_price: 2500, child_price: 0, impression: "楽しかった", is_diaper_place: true, parking: "ある"}}
  #     }.to change(Play, :count).by(1)
  #   expect{
  #       post travels_path, params: { hotel: {hotel_name: "test", address: "大阪", adult_price: 2500, child_price: 0, impression: "楽しかった", parking: "ある"}}
  #     }.to change(Hotel, :count).by(1)
  #   expect{
  #       post travels_path, params: { meal: {shop_name: "test", address: "大阪", adult_price: 2500, child_price: 0, impression: "楽しかった", is_baby_food_place: true, parking: "ある"}}
  #     }.to change(Meal, :count).by(1)
  #   expect{
  #       post travels_path, params: { category: {is_play: true, is_hotel: true, is_meal: true}}
  #     }.to change(Category, :count).by(1)
  #   expect{
  #       post travels_path, params: { travel_image: {image_url: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default.png'))}}
  #     }.to change(TravelImage, :count).by(1)
  # end
end
