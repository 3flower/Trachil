require 'rails_helper'
RSpec.describe "devise", type: :request do
  it '新規登録に遷移する' do
    get new_user_registration_path
    expect(response.status).to eq 200
  end
end
