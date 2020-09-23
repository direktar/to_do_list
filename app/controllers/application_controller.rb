# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def action_status(action, operation_name)
    if action
      success
    else
      danger_with_errors(operation_name)
    end
    redirect_to root_path
  end

  private

  def success
    flash[:success] = "#{controller_name.singularize.capitalize} was successfully #{action_name}."
  end

  def danger_with_errors(operation_name)
    flash[:danger] = "#{controller_name.singularize.capitalize} is not #{action_name}."
    flash[:errors] = operation_name.errors.full_messages.join(', ')
  end
end
