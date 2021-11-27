require 'rails_helper'

describe '記事一覧画面のテスト' do
  context '表示内容の確認テスト' do
    it '記事が新着順に表示される'
    it '記事に投稿した「ユーザー情報」「投稿内容」が表示される'
    it '「いいね」「コメントする」ボタンが表示される'
    it '記事を投稿したユーザーのみ「編集」「削除」ボタンが表示される'
  end
  context "表示内容の動作テスト" do
    it '「ユーザー名」をクリックするとユーザー詳細ページに遷移する'
    it '「店名」をクリックするとお店詳細ページに遷移する'
    it '「編集」をクリックすると記事編集ページに遷移する'
    it '「削除」をクリックすると記事を削除できる'
    it '未ログインユーザーが「いいね」をクリックするとログイン画面に遷移する'
    it '未ログインユーザーが「コメントする」をクリックするとログイン画面に遷移する'
    it 'ログインユーザーが「いいね」を1回クリックすると「いいね」がカウントされる'
    it 'ログインユーザーが「いいね」をもう1回クリックすると「いいね」が解除される'
    it 'ログインユーザーが「コメントする」をクリックすると記事詳細画面に遷移する'
  end
end
describe '記事詳細画面のテスト' do
  context '表示内容の確認テスト' do
    it '記事に投稿した「ユーザー情報」「投稿内容」が表示される'
    it '「いいね」ボタンが表示される'
    it '記事を投稿したユーザーのみ「編集」「削除」ボタンが表示される'
    it 'コメント入力フォーム、「送信」ボタンが表示される'
    it 'コメントした「ユーザー情報」「コメント内容」が表示される'
    it 'コメントしたユーザーのみ「削除」ボタンが表示される'
  end
  context "表示内容の動作テスト" do
    it '「ユーザー名」をクリックするとユーザー詳細ページに遷移する'
    it '「店名」をクリックするとお店詳細ページに遷移する'
    it '「編集」をクリックすると記事編集ページに遷移する'
    it '「削除」をクリックすると記事を削除できる'
    it 'ログインユーザーが「いいね」を1回クリックすると「いいね」がカウントされる'
    it 'ログインユーザーが「いいね」をもう1回クリックすると「いいね」が解除される'
    it 'コメントを入力し「送信ボタン」を押すとコメントが表示される'
    it 'コメントの「削除」ボタンを押すと削除される'
  end
end