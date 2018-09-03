class InstructorsController < ApplicationController
  before_action :find_instructor, only: [:show, :edit, :update]
  before_action :find_user, only: [:show, :edit, :update, :profile]

    def new
      @user = Instructor.new
    end

    def create
      @user = Instructor.new(instructor_params)
      @user.generate_sid
      if @user.save
        msg = "Registration Complete!!"
        flash[:notice] = msg
        log_in(@user)
        redirect_to @user
      else
        render 'new'
      end
    end

    def update
  if @instructor.update(instructor_params)
    p "article successfully updated"
    redirect_to @instructor
  else
    render 'edit'
  end
end


    def edit
    end

    def profile

    end

    def show

    end

    def index
      @instructor =Instructor.all
    end

    private

    def instructor_params
      params.require(:instructor).permit(:name, :last_name, :email, :bio, :photo, :password, :password_confirmation, :age, :salary, :education, :sid)
    end

    def find_instructor
      @instructor = Instructor.find(params[:id])
    end

    def find_user
        @user = current_user
    end

  end
