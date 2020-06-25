require 'rails_helper'
RSpec.describe "User", type: :request do
  let!(:user){create(:user)}
  before do
    sign_in user
  end
  it '編集画面に遷移する' do
    get edit_user_path(user)
    expect(response.status).to eq 302
  end
  it '詳細画面に遷移する' do
    get user_path(user)
    expect(response.status).to eq 302
  end
  it '退会画面に遷移する' do
    get quit_user_path(user)
    expect(response.status).to eq 302
  end
  # it '退会させる' do
  #   patch out_user_path(user)
  #   expect(user.reload.is_valid).to eq false
  # end
  # it 'ユーザーの更新' do
  #   expect(user.name).to eq "テスト名3"
  #   patch user_path(user), params: { user: {name: "よっしー"}}
  #   expect(user.reload.name).to eq "よっしー"
  # end
end
