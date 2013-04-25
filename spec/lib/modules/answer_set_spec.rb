require 'spec_helper'

describe AnswerSet do
  context "#initialize" do
    let(:_answers) { ["Green", "Blue", "Red"] }
    let(:answer_set) { described_class.new(_answers) }
    specify { answer_set.answers.size.should eq 3 }
  end
end