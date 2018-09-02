class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]
  before_action :find_course, only: [:edit, :show, :update]
  def new
      @student = Student.new
      @course = Course.find(params[:course_id])
      @cohort = Cohort.where(course_id: @course.id)
    end

    def create
      @student = Student.new(student_params)
      @course = Course.find(params[:course_id])
      @student.course_id = @course.id
      @student.generate_sid
      if @student.save
        redirect_to course_path(@student.course_id)
      else
        render 'new'
      end
  end

  def update
    if @student.update(student_params)
      redirect_to course_student_path(@student.course_id, @student)
    else
      render 'edit'
    end
  end

    def show
    end

    def edit
          @cohort = Cohort.all
    end

    def index
    end

    private

    def student_params
      params.require(:student).permit(:name, :last_name, :age, :education, :cohort_id)
    end

    def find_course
      @course = Course.find(params[:course_id])
    end

    def find_student
      @student = Student.find(params[:id])
    end


  end
