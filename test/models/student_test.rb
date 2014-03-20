require "minitest_helper"

class StudentTest < ActiveSupport::TestCase
  it "validates presence of name" do
    student = Student.new()
    student.valid?.wont_equal true
    student.errors.must_include :first_name
    student.errors.must_include :last_name
  end

  it "gives the full name" do
    student = Student.new(first_name: "Jo", last_name: "Last")
    student.name.must_equal "Jo Last"
  end
end
