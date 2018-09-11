class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]
  before_action :find_course, only: [:edit, :show, :update]
  def new
      @student = Student.new
      @course = Course.find(params[:course_id])

    end

    def create
      @student = Student.new(student_params)
      @course = Course.find(params[:course_id])
      @student.course_id = @course.id
      @student.generate_sid
      if @student.save
        msg = "Student Application Complete!!"
        flash[:notice] = msg
        redirect_to course_path(@student.course_id)
        UserMailer.with(student: @student).app_email.deliver_now
      else
        errors = @student.errors.full_messages
        flash.now[:error] = errors.flatten

        render 'new'
        # redirect_to new_course_student_path(@course.id)
      end
  end

  def update
    if @student.update(student_params)
      redirect_to course_student_path(@student.course_id, @student)
    else
      render 'edit'
    end
  end
    def all
      @student = Student.where(accepted: false, denied: false)
    end

    def show

    end

    def edit
      @cohort = Cohort.all
      @courses = Course.all
    end

    def index
      @student = Student.where(accepted: true)
    end

    def search
    end

    def results
      @results = params[:q]
      search_words = params[:q].downcase.split(' ')
      students_name = Student.pluck(:name)
      students_last = Student.pluck(:last_name)
      students = []
      students << students_name
      students << students_last
      students.flatten!
      matches = []
      @final_results = []
      search_words.each do |word|
        students.each do |s|
        matches << s if s.downcase.include?(word)
      end

  matches.each do |match|
      x = Student.where(name: match)
      x.each do |y|
      @final_results << y
    end
    z = Student.where(last_name: match)
    z.each do |y|
      @final_results << y
    end
  end
  @final_results.uniq!
end
end
    private

    def student_params
      params.require(:student).permit(:name, :last_name, :email, :address, :city, :state, :zip, :about, :agree, :age, :education, :accepted, :denied, :rewards, :cohort_id)
    end

    def find_course
      @course = Course.find(params[:course_id])
    end

    def find_student
      @student = Student.find(params[:id])
    end


  end
