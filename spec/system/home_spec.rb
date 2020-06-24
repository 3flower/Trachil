require 'rails_helper'
include Warden::Test::Helpers
describe 'ログインしていない状態', type: :system do
  before do
    visit root_path
  end

  context "ヘッダーのテスト" do
    subject { page }
    it 'タイトルが表示される' do
      is_expected.to have_content 'Trachil'
    end
    it ' ログイン表示される' do
      find('#login-show').click
      is_expected.to have_selector '.login-h2', text: 'ログイン'
    end
    # it '新規登録画面に遷移する' do
    #   find('#login-show').click
    #   click_link "アカウント作成"
    #   is_expected.to have_selector 'h2', text: "新規会員登録"
    # end
  end
  context 'ヘッダーのリンクを確認' do
    subject { current_path }
    it 'Home画面に遷移する' do
      find('.title').click
      is_expected.to eq(root_path)
    end
  end
  context 'フッターのリンクを確認' do
    subject { current_path }
    it 'Home画面に遷移する' do
      click_link 'home'
      is_expected.to eq(root_path)
    end
    it 'about画面に遷移する' do
      click_link 'about'
      is_expected.to eq(about_path)
    end
  end
end
