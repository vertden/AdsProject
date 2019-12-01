class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy,:show_user_ads]

  def index
    @ads = Ad.all.paginate(:per_page => 3, :page => params[:page])
  end

  def show_user_ads
    @ads = current_user.ads.all.paginate(:per_page => 3, :page => params[:page])
  end

  def show

  end

  def new
    @ad = Ad.new
    @ad.images.build
    @types = Type.all
  end

  def create
    @ad = Ad.new(ad_params)
    @ad.user_id = current_user.id
    if @ad.save
      redirect_to home_path
    else
      @types = Type.all
      render "new"
    end
  end

  def edit
    @types = Type.all
  end

  def update
    if @ad.update(ad_params)
      redirect_to home_path
    else
      render "edit"
    end
  end

  def destroy
    @ad.destroy
    redirect_to home_path
  end

  def set_ad
    @ad = Ad.find(params[:id])
  end

  private

  def ad_params
    params.require(:ad).permit(:body,
                               :image,
                               :type_id,
                               :images_attributes => [:name, :_destroy,:id])
  end

end
