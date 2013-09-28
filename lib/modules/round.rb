class Round
  attr_reader :correct_answer,
              :incorrect_answer,
              :question,
              :status

  STATUS_UNANSWERED           = 0
  STATUS_CORRECTLY_ANSWERED   = 1
  STATUS_INCORRECTLY_ANSWERED = 2

  def initialize(_question, _correct_answer, _incorrect_answer)
    @question         = _question
    @correct_answer   = _correct_answer
    @incorrect_answer =_ incorrect_answer
    @status           = ::Round::STATUS_UNANSWERED
  end

  def answer_question(suggested_answer)
    return unless status == ::Round::STATUS_UNANSWERED
    
    if suggested_answer == correct_answer
      @status = ::Round::STATUS_CORRECTLY_ANSWERED
    else
      @status = ::Round::STATUS_INCORRECTLY_ANSWERED
    end
  end

  def possible_answers
    @possible_answers ||= [correct_answer, incorrect_answer].shuffle
  end
end
