require "minitest_helper"

describe StudentsController do
  describe "new" do
    it "should get new" do
      get :new
      must_respond_with :success
    end

    it "should render the view template" do
      get :new
      must_render_template :new
      assigns(:student).must_be_instance_of Student
    end
  end

  describe "create" do
    it "should create a post" do
      assert_difference 'Student.count' do
        post :create, student: {first_name: "Matt", last_name: "Chicago"}
      end
      assert_redirected_to students_path
      assert_equal 'Student Was Successfully Created', flash[:notice]
    end
  end

  describe "index" do
    it "should get index" do
      get :index
      must_respond_with :success
    end

    it "should assign students" do
      get :index
      assigns(:students).must_equal([students(:Cann), students(:ben)])
    end
  end

  describe "destroy" do
    it "should delete a user" do
      student = Student.create(first_name: "good", last_name: "bye")
      delete :destroy, {id: student.id}
      Student.find_by_last_name("bye").must_equal(nil)
      assert_redirected_to students_path
    end
  end

  describe "search" do
    it "should search" do
      student1 = Student.create(first_name: "Search", last_name: "1")
      student2 = Student.create(first_name: "Joe", last_name: "Sam")
      Student.create(first_name: "Nope", last_name: "3")

      get :search, { q: "S", :format => :json }
      must_respond_with :success
      json = JSON.parse(response.body)
      json.length.must_equal 2
      json.must_include ({"id" => student1.id, "name" => student1.name})
      json.must_include ({"id" => student2.id, "name" => student2.name})
    end
  end

end

