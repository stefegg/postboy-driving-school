class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update]
  def new
    @course = Course.new

  end

  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def update
if @course.update(course_params)
  redirect_to @course
else
  render 'edit'
end
end


  def edit
  end

  def show
  end

  def index
    @course = Course.where(user_id: current_user.id)
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :hours, :reward)
end

  def find_course
    @course = Course.find(params[:id])
end
end
