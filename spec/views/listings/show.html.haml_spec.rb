require 'spec_helper'

describe "listings/show" do
  before do
    view.stub(:current_user => current_user )
    listing.user = user
    @listing = listing
  end

  let(:listing) { Listing.first }
  let(:user) { listing.user }

  let(:page) { render; rendered }
  subject { page }

  describe "edit/delete links" do
    context "when the current user created the listing" do
      let(:current_user) { user }
      it { should contain("Delete") }
      it { should contain("Edit") }
    end

    context "when the current user did not create the listing" do
      let(:current_user) { double }
      it { should_not contain("Delete") }
      it { should_not contain("Edit") }
    end

    context "when the user is not logged in" do
      let(:current_user) { nil }
      it { should_not contain("Delete") }
      it { should_not contain("Edit") }
    end
  end
end
