class CohortsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @cohort = Cohort.new
    @instructor = Instructor.all
  end

  def create
    @course = Course.find(params[:course_id])

    @cohort = Cohort.new(cohort_params)
    @cohort.course_id = @course.id
    if @cohort.save

      redirect_to course_cohort_path(@cohort.course_id, @cohort)
    else
      render 'new'
    end
end
  def edit
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def index
  end

  private
  def cohort_params
    params.require(:cohort).permit(:name, :description, :start_date, :end_date)
  end

  def find_cohort
    @cohort = Department.find(params[:id])
  end
end
