require 'spec_helper'

describe Answer do
  context "#initialize" do
    let(:text) { "Salt Lake City" }
    subject { described_class.new(text) }
    its(:text) { should eq text }
    its(:successfully_matched) { should be_false}
  end

  context "#try_to_match" do
    context "fails" do
      subject { described_class.new("Blue") }
      before { subject.try_to_match("Green") }
      its(:successfully_matched) { should be_false }
    end

    context "succeeds" do
      subject { described_class.new("Blue") }
      before { subject.try_to_match("Blue") }
      its(:successfully_matched) { should be_true }
    end
  end
end