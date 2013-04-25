require 'spec_helper'

describe Answer do
  context "#initialize" do
    let(:text) { "Salt Lake City" }
    subject { described_class.new(text) }
    its(:text) { should eq text }
    its(:previously_selected) { should be_false}
  end
end