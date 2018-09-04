class ApplicantsController < ApplicationController
  before_action :find_applicant, only: [:show, :edit, :update]
  before_action :find_course, only: [:edit, :show, :update]
  def new
    @applicant = Applicant.new
    @course = Course.find(params[:course_id])
  end
  def create
    @applicant = Applicant.new(applicant_params)
    @course = Course.find(params[:course_id])
    @applicant.course_id = @course.id
    @applicant.generate_aid
    if @applicant.save
      msg = "Application Complete!! Someone from our staff will contact you within the next 24-48 Hours!"
      flash[:notice] = msg
      redirect_to course_path(@applicant.course_id)
    else
      errors = @applicant.errors.full_messages
      flash.now[:error] = errors.flatten
      render 'new'
    end
end
  def edit
  end

  def show
  end

  def index
      @applicant = Applicant.all
  end

private
def find_course
  @course = Course.find(params[:course_id])
end

def find_applicant
  @applicant = Applicant.find(params[:id])
end


def applicant_params
  params.require(:applicant).permit(:name, :last_name, :email, :address, :city, :state, :zip, :age, :education, :about, :agree, :cohort_id, :course_id)

end
end
