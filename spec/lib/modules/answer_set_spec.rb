require 'spec_helper'

describe AnswerSet do
  let(:answers) { ["Green", "Blue", "Red"] }
  subject { described_class.new(answers) }

  context "#initialize" do
    specify { subject.answers.size.should eq 3 }
  end

  context "#matched_count" do
    context "0" do
      its(:matched_count) { should eq 0 }
    end

    context "1" do
      before { subject.record_answer("Green") }
      its(:matched_count) { should eq 1 }
    end

    context "2" do
      before do
        subject.record_answer("Green")
        subject.record_answer("Blue")
      end
      its(:matched_count) { should eq 2 }
    end

    context "3" do
      before do
        subject.record_answer("Red")
        subject.record_answer("Green")
        subject.record_answer("Blue")
      end
      its(:matched_count) { should eq 3 }
    end
  end

  context "#record_answer" do
    before { subject.record_answer("Blue") }
    specify { subject.answers[0].successfully_matched.should be_false }
    specify { subject.answers[1].successfully_matched.should be_true }
    specify { subject.answers[2].successfully_matched.should be_false  }
  end
end