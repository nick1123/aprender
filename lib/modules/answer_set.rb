class AnswerSet
  attr_reader :answers

  def initialize(_answers)
    @answers = _answers.map {|answer_text| Answer.new(answer_text)}
  end

end