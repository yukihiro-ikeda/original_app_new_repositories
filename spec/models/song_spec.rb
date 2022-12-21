require 'rails_helper'

RSpec.describe Song, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'バリデーションのテスト' do
    # let!(:team){ FactoryBot.create(:team)}
    context 'titleの入力欄が空の場合' do
      it 'バリデーションに引っかかる' do
        song = Song.new(title: '')
        expect(song).not_to be_valid
      end
    end
    context '全項目が入力されている場合' do
      it '登録が完了する' do
        user = FactoryBot.create(:second_user)
        team = Team.create(name: 'testteam1', owner_id: user.id)
        song = Song.create(title: 'jazz', team_id: team.id)
        expect(song).to be_valid
      end
    end
  end
end
   