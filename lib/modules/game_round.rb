class GameRound
  attr_reader :question, :correct_answer, :possible_answers

  def initialize(_question, _correct_answer, _wrong_answers)
    @question = _question
    @correct_answer = _correct_answer
    @possible_answers = (_wrong_answers << _correct_answer)
  end

  def is_correct_answer?(answer_candidate)
    answer_candidate == correct_answer
  end
end