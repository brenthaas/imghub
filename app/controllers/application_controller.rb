class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActionController::ParameterMissing do |ex|
    flash[:error] = ex.message
    respond_to do |format|
      format.html do
        flash[:error] = "Parameter Missing!"
        redirect_to images_url
      end
      format.json do
        render json: {message: "Parameter missing"}, status: 409
      end
    end
  end
end
