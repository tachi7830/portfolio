require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "記事一覧ページにアクセスできるか" do
    # 正常なレスポンスか？
    it "responds successfully" do
      get :index
      #レスポンスが返ってくることを期待する
      expect(response).to be_success
    end
    # 200(リクエスト成功)レスポンスが返ってきているか？
    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "記事投稿ページにアクセスできるか" do
    before do
      @user = FactoryBot.create(:user, :a)
    end
    context "login user" do
      it "responds successfully" do
        sign_in @user
        get :new
        expect(response).to be_success
      end
      it "returns a 200 response" do
        sign_in @user
        get :new
        expect(response).to have_http_status "200"
      end
    end
    context "not login user" do
      it "responds successfully" do
        get :new
        expect(response).to_not be_success
      end
      it "returns a 302 response" do
        get :new
        expect(response).to have_http_status "302"
      end
      # ログイン画面にリダイレクトされているか？
      it "redirects user_session_path" do
        get :new
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe "記事を保存できるか" do
    before do
      @user = FactoryBot.create(:user, :a)
    end
    # 正常に記事を作成できるか？
    it "create article" do
      sign_in @user
      expect {
        post :create, params: {
          article: {
            user_id: 1,
            shop_id: 1,
            prefecture_code: "2",
            images: [ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ],
            bread_name: "フランスパン",
            review: "とてもおいしいです！",
            rate: 5.0
          }
        }
      }.to change(@user.articles, :count).by(1)
    end
    # 記事作成後に作成した記事の詳細ページへリダイレクトされているか？
    it "redirects /articles/1" do
      sign_in @user
      post :create, params: {
        article: {
          user_id: 1,
          shop_id: 1,
          prefecture_code: "2",
          images: [ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ],
          bread_name: "フランスパン",
          review: "とてもおいしいです！",
          rate: 5.0
        }
      }
      expect(response).to redirect_to "/articles/1"
    end
  end

  describe "記事詳細ページにアクセスできるか" do
  before do
    @user = FactoryBot.create(:user, :a)
    @article = FactoryBot.create(:article)
  end
    context "login user" do
      it "responds successfully" do
        sign_in @user
        get :show, params: {id: @article.id}
        expect(response).to be_success
      end
      it "returns a 200 response" do
        sign_in @user
        get :show, params: {id: @article.id}
        expect(response).to have_http_status "200"
      end
    end
    context "not login user" do
      it "responds successfully" do
        get :show, params: {id: @article.id}
        expect(response).to_not be_success
      end
      it "returns a 302 response" do
        get :show, params: {id: @article.id}
        expect(response).to have_http_status "302"
      end
      it "redirects user_session_path" do
        get :show, params: {id: @article.id}
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe "記事編集ページにアクセスできるか" do
    before do
      @user = FactoryBot.create(:user, :a)
      @other_user = FactoryBot.create(:user, :b)
      @article = FactoryBot.create(:article)
    end
    context "article user" do
      it "responds successfully" do
        sign_in @user
        get :edit, params: {id: @article.id}
        expect(response).to be_success
      end
      it "returns a 200 response" do
        sign_in @user
        get :edit, params: {id: @article.id}
        expect(response).to have_http_status "200"
      end
    end
    context "not login user" do
      it "responds successfully" do
        get :edit, params: {id: @article.id}
        expect(response).to_not be_success
      end
      it "returns a 302 response" do
        get :edit, params: {id: @article.id}
        expect(response).to have_http_status "302"
      end
      it "redirects user_session_path" do
        get :edit, params: {id: @article.id}
        expect(response).to redirect_to user_session_path
      end
    end
    #記事投稿ユーザーとは別のユーザーの場合
    context "other user" do
      #記事一覧ページにリダイレクトすること
      it "redirects articles_path" do
        sign_in @other_user
        get :edit, params: {id: @article.id}
        expect(response).to redirect_to articles_path
      end
    end
  end

  describe "記事を更新できるか" do
    before do
      @user = FactoryBot.create(:user, :a)
      @article = FactoryBot.create(:article)
    end
    # 記事を更新できること
    it "update article" do
      sign_in @user
      article_params = {review: "うまい！"}
      patch :update, params: {id: @article.id, article: article_params }
      #.reloadでカラムを更新する
      expect(@article.reload.review).to eq "うまい！"
    end
    # 記事を更新すると詳細ページに遷移する
    it "redirects /articles/1" do
      sign_in @user
      article_params = {review: "うまい！"}
      patch :update, params: {id: @article.id, article: article_params}
      expect(response).to redirect_to "/articles/1"
    end
  end

  describe "記事を削除できるか" do
    before do
      @user = FactoryBot.create(:user, :a)
      @article = FactoryBot.create(:article)
    end
    # 記事を削除できるか？
    it "delete article" do
      sign_in @user
      expect {
        delete :destroy, params: {id: @article.id}
      }.to change(@user.articles, :count).by(-1)
    end
    # 記事を削除するとマイページに遷移する
    it "redirects user_path(@user)" do
      sign_in @user
      delete :destroy, params: {id: @article.id}
      expect(response).to redirect_to user_path(@user)
    end
  end
end