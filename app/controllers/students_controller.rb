class StudentsController < ApplicationController
  def index
    @students = Student.all.order(last_name: :asc)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = 'Student Was Successfully Created'
      redirect_to students_path
    else
      render 'new'
    end
  end

  def destroy
    Student.find_by_id(params[:id]).destroy
    redirect_to students_path
  end

  def search
    search_term = "%#{params[:q]}%"
    students = Student.where("first_name like ? or last_name like ?", search_term, search_term)
    students.map! do |student|
      {id: student.id, name: student.name}
    end
    render json: students
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
