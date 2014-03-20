require "minitest_helper"

describe WelcomeController do
  describe "index" do
    it "should get index" do
      get :index
      must_respond_with :success
    end

    it "should render the view template" do
      get :index
      must_render_template :index
    end
  end
end
