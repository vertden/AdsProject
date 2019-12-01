module AdsHelper
  def get_class(ad)
    if ad.status.draft?
      "text-secondary"
    else
      "text-success"
    end
  end
end
