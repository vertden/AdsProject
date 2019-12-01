require 'rails_helper'

RSpec.describe AdsController, type: :controller do
  let(:ad) {Ad.first}
  context "#index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end
  context "#show_user_ads" do
    it "returns a success response" do
      @user = User.first
      sign_in @user
      get :show_user_ads
      expect(response).to be_successful
    end
  end
  context "#new" do
    it "should render new page" do
      @user = User.first
      sign_in @user
      get :new
      expect(response).to render_template("new")
    end
  end
  context "#create" do
    before(:each) do
      @user = User.first
      sign_in @user
    end
    it "redirects to home if ad saved" do
      post :create, params: {ad: {body: "Some text",
                                  type_id: 1},
                             images_attributes: {"0" => {name: "", _destroy: "false"}}}
      expect(response).to redirect_to(home_path)
    end
    it "renders new page again if validations fail" do
      post :create, params: {ad: {body: ""}}
      expect(response).to render_template("new")
    end
  end
  context "#edit" do
    it "should render edit page" do
      @user = User.first
      sign_in @user
      get :edit, params: {id: ad.id}
      expect(response).to render_template("edit")
    end
  end
  context "#update" do
    before(:each) do
      @user = User.first
      sign_in @user
    end
    it "redirects to home if ad updated" do
      put :update, params: {ad: {body: "Some new text",
                                 type_id: 1},
                            images_attributes: {"0" => {name: "", _destroy: "false"}},
                            id: ad.id}
      expect(response).to redirect_to(home_path)
    end
    it "renders edit page again if validations fail" do
      put :update, params: {ad: {body: ""},
                            id: ad.id}
      expect(response).to render_template("edit")
    end
  end
end
