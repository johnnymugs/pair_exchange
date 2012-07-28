require 'spec_helper'

describe Listing do
  describe "#to_s" do
    subject { listing.to_s }

    let(:listing) { Listing.new(body: "blah") }
    it { should == listing.body }
  end
end
