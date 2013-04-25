class Round
  attr_reader :correct_answer, :possible_answers, :question

  def initialize(_question, _possible_answers, _correct_answer)
    @correct_answer   = ::Answer.new(_correct_answer)
    @possible_answers = ::AnswerSet.new(_possible_answers)
    @question         = _question
  end

  def completed?
    correct_answer.successfully_matched
  end

  def record_answer(answer_text)
    correct_answer.try_to_match(answer_text)
    possible_answers.record_answer(answer_text)
  end

end
