class CohortsController < ApplicationController
    before_action :find_cohort, only: [:show, :edit, :update]
    before_action :find_course, only: [:edit, :show, :update]
  def new
    @course = Course.find(params[:course_id])
    @cohort = Cohort.new
    @instructor = Instructor.all
  end

  def create
    @course = Course.find(params[:course_id])
    @instructor = Instructor.all
    @cohort = Cohort.new(cohort_params)
    @cohort.course_id = @course.id
    if @cohort.save
      msg = "Cohort Creation Complete!!"
      flash[:notice] = msg
    redirect_to course_cohort_path(@cohort.course_id, @cohort)
    else
      errors = @cohort.errors.full_messages
      flash.now[:error] = errors.flatten
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


  def destroy
    @cohort = Cohort.find(params[:id])
    course = Course.find(@cohort.course_id)
    @cohort.destroy
    respond_to do |format|
      format.js
    end
  end

  def all
    @cohort = Cohort.all
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
