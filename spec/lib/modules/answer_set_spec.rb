require 'spec_helper'

describe AnswerSet do
  let(:_answers) { ["Green", "Blue", "Red"] }
  let(:answer_set) { described_class.new(_answers) }

  context "#initialize" do
    specify { answer_set.answers.size.should eq 3 }
  end

  context "#record_answer" do
    before { answer_set.record_answer("Blue") }
    specify { answer_set.answers[0].successfully_matched.should be_false }
    specify { answer_set.answers[1].successfully_matched.should be_true }
    specify { answer_set.answers[2].successfully_matched.should be_false  }
  end
end