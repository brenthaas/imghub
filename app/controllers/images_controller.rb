class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(url: params[:url], title: params[:title])
    @image.save!
    render :show if @image.persisted?
  end

  def show
    @image = Image.find(params[:id])
  end
end
