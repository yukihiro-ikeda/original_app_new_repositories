require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  describe '登録機能' do
  #   context '新規ユーザを登録した場合' do
  #     it '登録ユーザの詳細が表示される' do
  #       visit new_user_registration_path
  #       fill_in 'user[email]', with: 'itou@example.com'
  #       fill_in 'user[password]', with: 'itouitou'
  #       fill_in 'user[password_confirmation]', with: 'itouitou'
  #       click_on 'アカウント登録'
  #       expect(page).to have_content 'itou@example.com'
  #       expect(page).to have_content 'ユーザーページ'
  #       click_on "チーム作成"
  #       fill_in 'team[name]', with: 'itouチーム'
  #       click_on "作成する"
  #       click_on "itouチーム"
  #       fill_in 'assign[email]', with:"user@example.com"
  #       click_on "メンバー招待"
  #       expect(page).to have_content 'user@example.com'
  #     end
  #   end

    context "ユーザがログインせずチーム作成に飛ぼうとした場合" do
      it "ログイン画面に遷移する" do

        
        visit new_team_path
        expect(page).to have_content "ログイン"
      end
    end
  end
  describe "セッション機能" do
    let!(:user){ FactoryBot.create(:user)}
    let!(:second_user){ FactoryBot.create(:second_user)}
    context "ユーザーがログインする場合" do
      before do
        visit new_user_session_path
        fill_in "user[email]", with: user.email
        fill_in "user[password]", with: user.password
        click_on "ログイン"
      end
      it "ログインができる" do
        expect(page).to have_content "ユーザーページ"
      end
      it "チーム作成画面に移管できる" do
        click_on "チーム作成"
        expect(page).to have_content "チーム名"
      end
    end
    context "一般ユーザがログインした場合" do
      let!(:second_user){FactoryBot.create(:second_user)}
      it "管理画面にアクセスできない" do
        visit new_user_session_path
        fill_in "user[email]", with: second_user.email
        fill_in "user[password]", with: second_user.password
        click_on "ログイン"
        expect(page).not_to have_content "管理者ページ"
      end
    end
    context '管理者がログインした場合' do
        it '管理画面にアクセスできる' do
          # FactoryBot.create(:user)
          visit new_user_session_path
          fill_in "user[email]", with: 'adminuser@example.com'
          fill_in "user[password]", with: 'adminpass'
          click_on "ログイン"
          visit rails_admin_path
          expect(page).to have_content 'サイト管理'
        end
      end
  end
end

      # it "今日のPOCCHIに遷移できる" do
      #   FactoryBot.create(:)
      #   visit new_answer_path
      #   expect(page).to have_content "今日"
      # end