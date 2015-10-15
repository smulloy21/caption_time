class CaptionsController < ApplicationController
  def create
    @user = current_user
    if params[:image_id]
      @current_image = Image.find(params[:image_id])
      @caption = @current_image.captions.new(caption_params)
    else
      @parent = Caption.find(params[:caption_id])
      @caption = @parent.captions.new(caption_params)
    end
    @caption.user_id = @user.id
    session[:return_to] ||= request.referer
    if @caption.save
      redirect_to session.delete(:return_to)
    else
      redirect_to images_path
    end
  end

  def update
    @caption = Caption.find(params[:id])
    if params['caption']
      @caption.update(caption_params)
    elsif params[:upvote]
      @caption.upvotes += 1
      @caption.save
    else
      @caption.downvotes += 1
      @caption.save
    end
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def destroy
    @caption = Caption.find(params[:id])
    @caption.destroy
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  private
  def caption_params
    params.require(:caption).permit(:text)
  end
end
