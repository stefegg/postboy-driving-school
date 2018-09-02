class PagesController < ApplicationController
  def home
  end

  def about
  end

  def course_book
        @courses = Course.all
        @cohorts = Cohort.where(course_id: @courses.ids)
  end
end
