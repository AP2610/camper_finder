class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
    # user_input = params[:query]
    # if user_input
    #   @vans = Van.search_by_address(user_input)
    #   redirect_to vans_path
    # else
    #   @vans = Van.all
    # end
  end

  def profile
    if current_user.present?
      render :profile
    else
      redirect_to new_user_registration_path
    end
  end
end
