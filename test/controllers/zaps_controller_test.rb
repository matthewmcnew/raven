require "minitest_helper"

describe ZapsController do
  describe "new" do
    it "should get new" do
      get :new
      must_respond_with :success
    end

    it "should render the new template" do
      get :new
      must_render_template :new
      assigns(:assignment).must_be_instance_of Assignment
    end
  end

  describe "index" do
    it "should get index" do
      get :index
      must_respond_with :success
    end

    it "should assign Zaps" do
      get :index
      assigns(:zaps).must_equal(Zap.all)
    end
  end

  describe "create" do
    it "should create a zap" do
      student1 = Student.create(first_name: "Search", last_name: "1")
      student2 = Student.create(first_name: "Joe", last_name: "Sam")

      assert_difference('Zap.count', 2) do
        assert_difference('Assignment.count', 1) do
          post :create,  { assignment: {name: "History"}, students: "#{student1.id},#{student2.id}" }
        end
      end

      Zap.find_by_student_id(student2.id).assignment.name.must_equal "History"

      assert_redirected_to zaps_path
    end
  end

  describe "destroy" do
    it "should delete a zap" do
      student = Student.create(first_name: "good", last_name: "bye")
      assignment = Assignment.create(name: "Rad")
      zap = Zap.create(student: student, assignment: assignment)

      assert_difference('Zap.count', -1) do
        delete :destroy, {id: zap.id}
      end

      assert_redirected_to zaps_path
    end
  end
end