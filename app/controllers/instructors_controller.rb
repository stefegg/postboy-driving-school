class InstructorsController < ApplicationController
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

    def edit
    end

    def show
      @user = current_user
    end

    def index
    end

    private

    def instructor_params
      params.require(:instructor).permit(:name, :last_name, :email, :bio, :photo, :password, :password_confirmation, :age, :salary, :education, :sid)
    end



  end
