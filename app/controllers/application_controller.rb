class ApplicationController < ActionController::Base
  # before_action   :authenticate_user!
  add_flash_types :success, :danger, :errors

  private

  def success
    flash[:success] = "#{controller_name.singularize.capitalize} was successfully #{action_name}."
  end

  def danger_with_errors(model_name)
    flash[:danger] = "#{controller_name.singularize.capitalize} is not #{action_name}."
    flash[:errors] = model_name.errors.full_messages.join(', ')
  end

end
