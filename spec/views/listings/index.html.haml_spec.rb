require 'spec_helper'

describe "listings/index" do
  before do
    view.stub(:current_user => current_user )
    @listings = listings
  end

  let(:current_user) { nil }
  let(:listings) { [] }

  let(:page) { render; rendered }
  subject { page }

  describe "new listings link" do
    context "when the user is logged in" do
      let(:current_user) { double }
      it { should contain("Add Listing") }
    end

    context "when the user is not logged in" do
      let(:current_user) { nil }
      it { should_not contain("Add Listing") }
    end
  end

  describe "listing" do
    let(:listings) { [listing] }
    let(:listing) { Listing.new(body: body) }
    let(:body) { "who wants to pair?" }
    let(:user) { User.first }

    before do
      listing.user = user
      listing.save!
    end

    it { should contain(body) }
    it { should contain(Date.today.to_s) }
  end
end
