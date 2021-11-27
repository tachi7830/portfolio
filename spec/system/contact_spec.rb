require 'rails_helper'

describe 'お問合せ画面のテスト' do
  context '表示内容の確認テスト' do
    it 'nameの入力フォームが表示される'
    it 'emailの入力フォームが表示される'
    it 'passwordの入力フォームが表示される'
    it '「送信」ボタンが表示される'
  end
  context "表示内容の動作テスト" do
    it '全ての項目を入力して送信ボタンをクリックすると「お問合せ完了」ページに遷移する'
  end
end