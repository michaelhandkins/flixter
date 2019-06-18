class LessonsController < ApplicationController
before_action :authenticate_user!
before_action :require_authorized_for_lessons
  def show

  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def require_authorized_for_lessons
    @course = current_lesson.section.course
    if current_user.enrolled_in?(@course) == false
      redirect_to course_path(@course), alert: 'Must be enrolled in course'
    end
  end

end
