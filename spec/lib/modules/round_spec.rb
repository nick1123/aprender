require 'spec_helper'

describe Round do
  let(:question) { "Capitol of Utah" }
  let(:possible_answers) { ["Salt Lake City", "Salem", "Sparta"] }
  let(:correct_answer) { "Salt Lake City" }

  subject { described_class.new(question, possible_answers, correct_answer) }

  context "#initialize" do
    specify { subject.question.should eq question }
  end

  context "#completed?" do
    context "false" do
      context "0 answered" do
        specify { subject.completed?.should be_false }
      end

      context "1 answered" do
        before { subject.record_answer("Salem") }
        specify { subject.completed?.should be_false }
      end

      context "2 answered" do
        before do
          subject.record_answer("Salem")
          subject.record_answer("Sparta")
        end
        specify { subject.completed?.should be_false }
      end
    end

    context "false" do
      context "1 answered" do
        before { subject.record_answer("Salt Lake City") }
        specify { subject.completed?.should be_true }
      end

      context "2 answered" do
        before do
          subject.record_answer("Salem")
          subject.record_answer("Salt Lake City")
        end
        specify { subject.completed?.should be_true }
      end

      context "3 answered" do
        before do
          subject.record_answer("Sparta")
          subject.record_answer("Salem")
          subject.record_answer("Salt Lake City")
        end
        specify { subject.completed?.should be_true }
      end
    end
  end

  context "#record_answer" do
    before { subject.record_answer("Salem") }
    specify { subject.completed?.should be_false }
  end

end