require 'spec_helper'

describe ImagesController do
  describe "#new" do
    it "assigns a new Image for setup" do
      get :new
      assigns(:image).should be_a_new Image
    end
  end

  describe "#create" do
    context "with valid parameters" do
      before(:each) do
        @params = {url: "http://something.com/image.gif", title: "A gif for you"}
      end
      it "creates an image" do
        expect{ post :create, @params }.to change{Image.count}.by 1
      end
    end
  end

  describe "#show" do
    before(:each) do
      @img = mock_model(Image)
      Image.stub(:find).and_return @img
    end
    it "sets up @image with the found image" do
      get :show, {id: @img.id}
      assigns(:image).should == @img
    end
  end
end