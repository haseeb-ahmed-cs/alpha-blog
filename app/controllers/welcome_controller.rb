class WelcomeController < ApplicationController

  def home
    redirect_to articles_path if logged_in?
  end

  def about
  end
  def catch_404
  render file: "#{Rails.root}/public/404", status: :not_found
end
end
