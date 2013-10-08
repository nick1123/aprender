class Round
  attr_reader :correct_answer,
              :incorrect_answer,
              :possible_answers,
              :question

  def initialize(_question, _correct_answer, _incorrect_answer)
    @question         = _question
    @correct_answer   = _correct_answer
    @incorrect_answer = _incorrect_answer
    @possible_answers = [correct_answer, incorrect_answer].shuffle
  end

  def answered_correctly?(selected_answer)
    return selected_answer == correct_answer
  end
end
