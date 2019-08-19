class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
  end

  def profile
    if current_user.present?
      render :profile
    else
      redirect_to root_path
    end
  end
end
