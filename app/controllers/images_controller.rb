class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save!
    redirect_to images_url if @image.persisted?
  end

  def show
    @image = Image.find(params[:id])
  end

  def index
    @images = Image.all
  end

  private

    def image_params
      params.require(:image).permit(:title, :url)
    end
end
