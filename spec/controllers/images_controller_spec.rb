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
        @params = {image: {url: "http://something.com/image.gif", title: "A gif for you"}}
      end
      it "sanitizes the parameter list" do
        params_stub = ActionController::Parameters.any_instance.should_receive(:permit).and_return(@params[:image])
        post :create, @params
      end
      it "creates an image" do
        expect{ post :create, @params }.to change{Image.count}.by 1
      end
      it "redirects to index after save" do
        post :create, @params
        response.should redirect_to images_url
      end
    end
    context "with invalid params" do
      let(:empty_params) { {} }
      it "returns a 409 status" do
        post :create, empty_params
        response.should redirect_to images_url
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

  describe "#index" do
    it "assigns all images to @images" do
      get :index
      assigns(:images).should == Image.all
    end
  end
end
