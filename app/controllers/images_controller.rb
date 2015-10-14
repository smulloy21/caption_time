class ImagesController < ApplicationController
  def index
    @images = Image.all
    @image = Image.new
    @user = current_user
  end
end
