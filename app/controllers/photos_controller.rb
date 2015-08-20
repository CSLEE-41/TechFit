class PhotosController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos.all
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def show
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @photos = @user.photos
    @photo = @user.photos.build(photo_params)
    @photo.user = @user 

    if @photo.save
      redirect_to user_photos_path, notice: "Photo was added."
    else
      flash[:error] = "There was an error saving the photo. Please try again."
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(photo_params)
      redirect_to user_photo_path, notice: "Photo was updated."
    else 
      flash[:error] = "Failed to update photo. Please try again."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])

    if @photo.destroy
      flash[:notice] = "\"#{@photo.title}\" was deleted."
      redirect_to user_photos_path
    else
      flash[:error] = "Failed to delete photo. Please try again."
      render :show
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:photo_img, :title, :message, :day)
  end
end
