class RoundFactory
  attr_reader :questions_with_answers

  def initialize(_questions_with_answers)
    @questions_with_answers = _questions_with_answers
  end

  def build_single_round(question)
    correct_answer   = questions_with_answers[question]
    incorrect_answer = answers.sample

    if incorrect_answer == correct_answer
      incorrect_answer = answers.sample
    end

    return Round.new(question, correct_answer, incorrect_answer)
  end

  def build_rounds_for_all_questions
    questions.map {|question| build_single_round(question) }
  end

  private

  def answers
    @answers ||= questions_with_answers.values
  end

  def questions
    @questions ||= questions_with_answers.keys
  end
end
