require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'バリデーションのテスト' do
    context 'emailの入力欄が空の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(email: '', password: 'testpass', password_confirmation: 'testpass')
        expect(user).not_to be_valid
      end
    end
    context '全項目が入力されている場合' do
      it '登録が完了する' do
        user = User.new(email: 'user@example.com', password: 'testpass', password_confirmation: 'testpass')
        expect(user).to be_valid
      end
    end
  end
end
