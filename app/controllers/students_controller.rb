class StudentsController < ApplicationController
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
    def show
    end

    def edit
    end

    def index
    end

    private

    def student_params
      params.require(:student).permit(:name, :last_name, :age, :education, :cohort_id)
    end
  end
