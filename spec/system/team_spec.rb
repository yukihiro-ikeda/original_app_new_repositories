require 'rails_helper'
RSpec.describe 'チーム登録機能', type: :system do
  let!(:second_user) { FactoryBot.create(:second_user) }
  describe '登録機能' do
    context '招待フォームにemailを入力した場合' do
      it '登録ユーザの詳細が表示される' do
        visit new_user_registration_path
        fill_in 'user[email]', with: 'itou@example.com'
        fill_in 'user[password]', with: 'itouitou'
        fill_in 'user[password_confirmation]', with: 'itouitou'
        click_on 'アカウント登録'
        expect(page).to have_content 'itou@example.com'
        expect(page).to have_content 'ユーザーページ'
        click_on "チーム作成"
        fill_in 'team[name]', with: 'itouチーム'
        click_on "作成する"
        click_on "itouチーム"
        fill_in 'assign[email]', with:"user@example.com"
        click_on "メンバー招待"
        expect(page).to have_content 'user@example.com'
      end
    end
  end
end
