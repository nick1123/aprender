class Round
  attr_reader :correct_answer,
              :possible_answers,
              :question

  def initialize(_question, _correct_answer, _incorrect_answer)
    @question         = _question
    @correct_answer   = _correct_answer
    @possible_answers = [correct_answer, incorrect_answer].shuffle
  end

  def answered_correctly?(suggested_answer)
    return suggested_answer == correct_answer
  end
end
