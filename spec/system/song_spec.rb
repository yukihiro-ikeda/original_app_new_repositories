require 'rails_helper'
RSpec.describe 'ソング作成機能', type: :system do
  let!(:second_user) { FactoryBot.create(:second_user) }
  describe '登録機能' do
    before do
      visit new_user_registration_path
      fill_in 'user[email]', with: 'itou@example.com'
      fill_in 'user[password]', with: 'itouitou'
      fill_in 'user[password_confirmation]', with: 'itouitou'
      click_on 'アカウント登録'
      click_on "チーム作成"
      fill_in 'team[name]', with: 'itouチーム'
      click_on "作成する"
      click_on "itouチーム"
    end
    context 'ソングを作成した場合' do
      it 'ソング名が表示される' do
        click_on "ソングスペース作成"
        fill_in 'song[title]', with: 'ソング1'
        click_on "作成する"
        expect(page).to have_content 'ソング1'
      end
    end
  end
end
