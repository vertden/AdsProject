module ProfilesHelper
  def get_avatar
    if @profile.avatar?
      @profile.avatar_url(:thumb)
    else
      "avatar.jpeg"
    end
  end
end
