class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?


  rescue_from ActionController::RoutingError do |exception|
 logger.error 'Routing error occurred'
 render plain: '404 Not found', status: 404
end

def catch_404
render file: "#{Rails.root}/public/404", status: :not_found
end

def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
    render_404
  end

  def render_404
    render file: "#{Rails.root}/public/404", status: :not_found
  end
    def current_user

    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    end

    def logged_in?

    !!current_user

    end

    def require_user

      if !logged_in?

      flash[:danger] = "You must be logged in to perform that action"

      redirect_to root_path

      end
    end
end
