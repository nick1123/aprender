class AnswerSet
  attr_reader :answers

  def initialize(_answers)
    @answers = _answers.map {|answer_text| Answer.new(answer_text)}
  end

  # def answers_matched

  # end

  def record_answer(answer_text)
    answers.each {|answer| answer.try_to_match(answer_text) }
  end

end