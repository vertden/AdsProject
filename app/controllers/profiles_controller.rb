class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def show

  end

  def edit

  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path
    else
      render "edit"
    end
  end

  def set_profile
    @profile = current_user
  end
  def profile_params
    params.require(:profile).permit(:first_name,
                                    :second_name,
                                    :avatar)
  end
end
