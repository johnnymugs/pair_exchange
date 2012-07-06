require 'spec_helper'

describe ListingsController do
  describe "with a current_user" do
    let(:current_user) { User.create! }

    before do
      controller.stub :current_user => current_user
    end

    it "should create a listing for the user" do
      post :create, listing: { body: "blah"}
      listing = Listing.last
      listing.user.should == current_user
      listing.body.should == "blah"
    end
  end
end
