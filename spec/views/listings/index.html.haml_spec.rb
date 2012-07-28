require 'spec_helper'

describe "listings/index" do
  before do
    view.stub(:current_user => current_user )
    @listings = []
    render
  end

  let(:current_user) { nil }

  let(:page) { rendered }
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
end
