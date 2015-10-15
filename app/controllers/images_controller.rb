class ImagesController < ApplicationController
  def index
    @images = Image.all.ranking
    @image = Image.new
    @user = current_user
  end

  def create
    @user = current_user
    @image = Image.new(image_params)
    @image.user_id = @user.id
    @image.save
    redirect_to images_path
  end

  def show
    @current_image = Image.find(params[:id])
    @image = Image.new
    @user = current_user
    @caption = Caption.new
  end

  def update
    @current_image = Image.find(params[:id])
    @current_image.upvotes += 1
    @current_image.save
    redirect_to images_path
  end

  private
  def image_params
    params.require(:image).permit(:img)
  end
end
