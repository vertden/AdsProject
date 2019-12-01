require 'rails_helper'

RSpec.describe AdsController, type: :controller do
  context "#index" do
    it "returns a success index response" do
      get :index
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
                             images_attributes: {"0"=>{name:"", _destroy:"false"}}}
      expect(response).to redirect_to(home_path)
    end
    it "renders new  page again if validations fail" do
      post :create, params: {ad: {body: ""}}
      expect(response).to render_template("new")
    end
  end
end
