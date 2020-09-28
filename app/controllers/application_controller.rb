# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def action_status(action, object)
    action ? success : danger_with_errors(object)
    redirect_to root_path
  end

  private

  def success
    flash[:success] = "#{controller_name.singularize.capitalize} was successfully #{action_name}."
  end

  def danger_with_errors(object)
    flash[:danger] = "#{controller_name.singularize.capitalize} is not #{action_name}."
    flash[:errors] = object.errors.full_messages.join(', ')
  end
end
