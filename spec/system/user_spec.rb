require 'rails_helper'

describe '未ログインユーザーのテスト' do
  describe 'トップ画面のテスト' do
    context "ヘッダーのリンクテスト" do
      it "「ロゴ」のリンク先が正しい root_path"
      it "「お店一覧」のリンク先が正しい shops_path"
      it "「記事一覧」のリンク先が正しい articles_path"
      it "「会員登録」のリンク先が正しい new_user_registration_path"
      it "「ログイン」のリンク先が正しい new_user_session_path"
      it "「お問合せ」のリンク先が正しい new_contact_path"
    end
    context "表示内容の確認" do
      it '「画像スライド」が表示される'
      it '「いいねランキング」が表示される'
      it '「新着記事が表示される」'
    end
      it '「ユーザー名」をクリックするとユーザー詳細ページに遷移する'
      it '「店名」をクリックするとお店の詳細ページに遷移する'
  end
  
  describe '会員登録画面のテスト' do
    context '表示内容の確認' do
      it 'nameフォームが表示される'
      it 'emailフォームが表示される'
      it 'passwordフォームが表示される'
      it 'password_confirmationフォームが表示される'
      it '登録ボタンが表示される'
    end
    context '会員登録のテスト' do
      it 'フォームに入力し登録ボタンを押すと登録メールアドレスに認証メールが送信される'
      it '認証メール送信後、送信確認ページに遷移する mail_check_path'
      it '認証メールの「ユーザー認証を実行」を押すとログイン画面に遷移する new_user_session_path'
      it '会員登録される'
    end
  end
  
  describe 'ログイン画面のテスト' do
    context '表示内容の確認' do
      it 'emailフォームが表示される'
      it 'passwordフォームが表示される'
      it 'ログインボタンが表示される'
    end
    context 'ログイン成功のテスト' do
      it 'emailとpasswordを入力し「ログイン」ボタンを押すとログインできる'
      it 'ログイン後、TOPページに遷移する'
    end
    context 'ログイン失敗のテスト' do
      it 'emailとpasswordが未入力の時「ログイン」ボタンを押すとログインに失敗する'
      it 'ログイン失敗後、ログインページに遷移する'
    end
  end
end

describe 'ログインユーザーのテスト' do
  describe 'トップ画面のテスト' do
    context "ヘッダーのリンクテスト" do
      it "「お店一覧」のリンク先が正しい shops_path"
      it "「記事一覧」のリンク先が正しい articles_path"
      it "「投稿する」のリンク先が正しい new_article_path"
      it "「マイページ」のリンク先が正しい user_path(current_user.id)"
      it "「お問合せ」のリンク先が正しい new_contact_path"
      it "「ログアウト」のリンク先が正しい destroy_user_session_path"
    end
  end
  
  describe 'ユーザーログアウトのテスト' do
    context 'ログアウト機能のテスト' do
      it '「ログアウト」ボタンを押すとログアウトできる'
      it 'ログアウト後、TOPページに遷移する'
    end
  end
end