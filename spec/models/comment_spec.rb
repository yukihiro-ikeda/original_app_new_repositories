require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'バリデーションのテスト' do
    # let!(:team){ FactoryBot.create(:team)}
    context 'contentの入力欄が空の場合' do
      it 'バリデーションに引っかかる' do
        comment = Comment.new(content: '')
        expect(comment).not_to be_valid
      end
    end
    context '全項目が入力されている場合' do
      it '登録が完了する' do
        user = FactoryBot.create(:second_user)
        team = Team.create(name: 'testteam1', owner_id: user.id)
        song = Song.create(title: 'jazz', team_id: team.id)
        comment = Comment.create(content: 'drum追加求む', song_id: song.id, user_id: user.id)
        expect(comment).to be_valid
      end
    end
  end
end
