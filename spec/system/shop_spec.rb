require 'rails_helper'

describe 'お店一覧画面のテスト' do
  context '表示内容の確認テスト' do
    it 'お店が新着順に表示される'
    it 'お店の「image」「name」「address」「description」が表示される'
  end
  context "表示内容の動作テスト" do
    it '「店名」をクリックするとお店詳細ページに遷移する'
  end
end

describe 'お店詳細画面のテスト' do
  context '表示内容の確認テスト' do
    it 'お店の「image」「news」「name」「address」「description」「url」「phone_number」「opening_hour」「closed_day」が表示される'
    it '「お気に入り」ボタンが表示される'
    it 'お店に登録されたパンの「image」「name」「price」が表示される'
    it '「全ての商品を見る」ボタンが表示される'
    it '住所に紐づいたGoogleMapが表示される'
    it 'お店に紐づいた記事が表示される'
    it '記事を投稿したユーザーの「image」「name」「created_at」が表示される'
    it '投稿された記事の「images」「bread_name」「review」「rate」が表示される'
    it '「いいね」「コメントする」ボタンが表示される'
  end
  context "表示内容の動作テスト" do
    it '「ユーザー名」をクリックするとユーザー詳細ページに遷移する'
    it 'ログインユーザーが「いいね」を1回クリックすると「いいね」がカウントされる'
    it 'ログインユーザーが「いいね」をもう1回クリックすると「いいね」が解除される'
    it '未ログインユーザーが「いいね」をクリックするとログイン画面に遷移する'
    it '未ログインユーザーが「コメントする」をクリックするとログイン画面に遷移する'
    it 'ログインユーザーが「コメントする」をクリックすると記事詳細画面に遷移する'
  end
end