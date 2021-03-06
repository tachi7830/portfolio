require 'rails_helper'

describe '未ログインユーザーのテスト' do
  describe 'トップ画面のテスト' do
    context "ヘッダーの表示の確認テスト" do
      it "「ロゴ」が表示されている"
      it "「お店一覧」が表示されている"
      it "「記事一覧」が表示されている"
      it "「会員登録」が表示されている"
      it "「ログイン」が表示されている"
      it "「お問合せ」が表示されている"
      it "「検索フォーム」が表示されている"
      it "「都道府県」のセレクトボックスが表示されている"
      it "「検索」ボタンが表示されている"
    end
    context "ヘッダーの動作テスト" do
      it "「ロゴ」をクリックするとTOPページに遷移する"
      it "「お店一覧」」をクリックするとお店一覧ページに遷移する"
      it "「記事一覧」」をクリックすると記事一覧ページに遷移する"
      it "「会員登録」」をクリックすると会員登録ページに遷移する"
      it "「ログイン」」をクリックするとログインページに遷移する"
      it "「お問合せ」をクリックするとTOPページに遷移する"
    end
    context "検索機能の動作テスト" do
      it "「店名」のみで検索すると検索ワードに一致したお店が表示される"
      it "「都道府県」のみで検索すると住所に一致したお店が表示される"
      it "「店名」と「都道府県」合わせて検索すると両方に一致したお店が表示される"
    end
    context "表示の確認テスト" do
      it '「画像スライド」が表示される'
      it '「いいねランキング」が5つまで表示される'
      it '「新着記事が表示される」が3つまで表示される'
    end
    context "表示内容の動作テスト" do
      it '「ユーザー名」をクリックするとユーザー詳細ページに遷移する'
      it '「店名」をクリックするとお店の詳細ページに遷移する'
    end
  end

  describe '会員登録画面のテスト' do
    context '表示内容の確認' do
      it 'nameフォームが表示される'
      it 'emailフォームが表示される'
      it 'passwordフォームが表示される'
      it 'password_confirmationフォームが表示される'
      it '登録ボタンが表示される'
    end
    context '表示内容の動作テスト' do
      it 'フォームに入力し「登録」ボタンを押すと登録メールアドレスに認証メールが送信される'
      it '認証メール送信後、送信確認ページに遷移する'
      it '認証メールの「ユーザー認証を実行」を押すとログイン画面に遷移する'
      it '会員登録される'
    end
  end

  describe 'ログイン画面のテスト' do
    context '表示内容の確認' do
      it 'emailフォームが表示される'
      it 'passwordフォームが表示される'
      it '「ログイン」ボタンが表示される'
    end
    context 'ログインの動作テスト' do
      it 'emailとpasswordを入力し「ログイン」ボタンを押すとログインできる'
      it 'ログイン後、TOPページに遷移する'
    end
  end
  describe 'ユーザー詳細画面のテスト' do
    context '表示内容の確認' do
      it 'ユーザーの「image」「name」が表示される'
      it 'ユーザーの投稿一覧が表示される'
      it '「いいね」「コメントする」ボタンが表示される'
    end
    context '表示内容の動作テスト' do
      it '店名をクリックするとお店詳細ページに遷移する'
      it '「いいね」「コメントする」ボタンをクリックするとログイン画面に遷移する'
    end
  end 
end

describe 'ログインユーザーのテスト' do
  describe 'トップ画面のテスト' do
    context "ヘッダーの表示の確認テスト" do
      it "「ロゴ」が表示されている"
      it "「お店一覧」が表示されている"
      it "「記事一覧」が表示されている"
      it "「投稿する」が表示されている"
      it "「マイページ」が表示されている"
      it "「お問合せ」が表示されている"
      it "「ログアウト」が表示されている"
      it "「検索フォーム」が表示されている"
      it "「都道府県」のセレクトボックスが表示されている"
      it "「検索」ボタンが表示されている"
    end
    context "ヘッダーの動作テスト" do
      it "「ロゴ」」をクリックするとTOPページに遷移する"
      it "「お店一覧」」をクリックするとお店一覧ページに遷移する"
      it "「記事一覧」」をクリックすると記事一覧ページに遷移する"
      it "「投稿する」をクリックすると記事投稿ページに遷移する"
      it "「マイページ」をクリックするとユーザー詳細ページに遷移する"
      it "「お問合せ」をクリックするとお問合せページに遷移する"
      it "「ログアウト」をクリックするとログアウトできる"
    end
    context "検索機能の動作テスト" do
      it "「店名」のみで検索すると検索ワードに一致したお店が表示される"
      it "「都道府県」のみで検索すると住所に一致したお店が表示される"
      it "「店名」と「都道府県」合わせて検索すると両方に一致したお店が表示される"
    end
    context 'ログアウトのテスト' do
      it '「ログアウト」ボタンを押すとログアウトできる'
      it 'ログアウト後、TOPページに遷移する'
    end
  end

  describe 'ログアウトのテスト' do
    context '表示内容の動作テスト' do
      it '「ログアウト」ボタンを押すとログアウトできる'
      it 'ログアウト後、TOPページに遷移する'
    end
  end
  
  describe 'ユーザー詳細画面のテスト' do
    context '表示内容の確認' do
      it 'ユーザーの「image」「name」が表示される'
      it 'ユーザーの投稿一覧が表示される'
      it '「いいね」「コメントする」ボタンが表示される'
    end
    context '表示内容の動作テスト' do
      it '店名をクリックするとお店詳細ページに遷移する'
      it 'ユーザーが「いいね」を1回クリックすると「いいね」がカウントされる'
      it 'ユーザーが「いいね」をもう1回クリックすると「いいね」が解除される'
      it 'ユーザーが「コメントする」をクリックすると記事詳細ページに遷移する'
    end
  end
  
  describe 'ログインユーザー詳細画面のテスト' do
    context '表示内容の確認' do
      it 'ログインユーザーの「image」「name」「ユーザー情報編集する」が表示される'
      it 'ログインユーザーの投稿一覧が表示される'
      it 'ログインユーザーのお気に入り店一覧が表示される'
      it '「いいね」「コメントする」「編集」「削除」ボタンが表示される'
    end
    context '表示内容の動作テスト' do
      it '店名をクリックするとお店の詳細ページに遷移する'
      it 'ユーザーが「いいね」を1回クリックすると「いいね」がカウントされる'
      it 'ユーザーが「いいね」をもう1回クリックすると「いいね」が解除される'
      it 'ユーザーが「コメントする」をクリックすると記事詳細ページに遷移する'
    end
  end 
end