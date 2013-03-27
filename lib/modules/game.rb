class Game
  attr_reader :answers, :questions_and_answers, :questions_missed, :questions_original

  def initialize
    @answers = []
    @questions_and_answers = {}
    @questions_missed = []
    @questions_original = []
  end

  def add_question_and_answer(question, answer)
    @questions_and_answers[question] = answer
    @answers << answer

    # Add the question 2 times
    (1..2).each do
      @questions_original << question
    end
  end

  def more?
    !finished?
  end

  def finished?
    questions_original.blank? && questions_missed.blank?
  end

  def next
    @questions_original.shuffle!
    question = @questions_original.pop
    correct_answer = questions_and_answers[question]
    wrong_answers = []
    while wrong_answers.size < 3
      potential_wrong_answer = answers.sample
      wrong_answers << potential_wrong_answer if potential_wrong_answer != correct_answer
    end

    return GameRound.new(question, correct_answer, wrong_answers)
  end
end