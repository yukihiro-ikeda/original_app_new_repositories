require 'rails_helper'

RSpec.describe Team, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'バリデーションのテスト' do
    context 'nameの入力欄が空の場合' do
      it 'バリデーションに引っかかる' do
        team = Team.new(name: '', owner_id: 1)
        expect(team).not_to be_valid
      end
    end
    context '全項目が入力されている場合' do
      it '登録が完了する' do
        @user = FactoryBot.create(:second_user)
        team = Team.new(name: 'testteam1', owner_id: @user.id)
        expect(team).to be_valid
      end
    end
  end
end
