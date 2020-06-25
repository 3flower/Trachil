require 'rails_helper'
include Warden::Test::Helpers
describe 'ログインしている場合', type: :system do
  let!(:user) { create(:user) }
  before do
    login_as user, scope: :user
    visit root_path
  end
  subject { page }
  it '流れ' do
    # タイトルをクリックすると投稿一覧に遷移する
    # click_link 'Trachil'
    # puts page.body
    # is_expected.to have_selector '.play-box', text: '遊び'
    # 投稿をクリックすると新規投稿に遷移する

  end
end
