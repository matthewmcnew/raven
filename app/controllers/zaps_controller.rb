class ZapsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def index
    @zaps = Zap.all
  end

  def create
    assignment = Assignment.create!(assignment_params)
    params[:students].split(",").each do |student_id|
      Zap.create!(student_id: student_id.to_i, assignment: assignment)
    end
    redirect_to zaps_path
  end

  def destroy
    Zap.find(params[:id]).destroy
    redirect_to zaps_path
  end

  private

  def assignment_params
    params.require(:assignment).permit(:name)
  end
end
