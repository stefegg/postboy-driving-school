class CohortsController < ApplicationController
    before_action :find_cohort, only: [:show, :edit, :update]
    before_action :find_course, only: [:edit, :update]
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

def update
  if @cohort.update(cohort_params)
    redirect_to course_cohort_path(@cohort.course_id, @cohort)
  else
    render 'edit'
  end
end

  def edit
      @instructor = Instructor.all
  end

  def show
  end

  def index
    @cohorts = Cohort.where(instructor: current_user.full_name)
  end
  private
  def cohort_params
    params.require(:cohort).permit(:name, :description, :start_date, :end_date, :instructor, :id)
  end


  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_cohort
    @cohort = Cohort.find(params[:id])
  end
end
