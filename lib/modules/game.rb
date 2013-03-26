class Game

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

  def next
    @questions_original.shuffle!
    question = @questions_original.pop
    correct_answer = questions_and_answers[question]
    return GameRound.new(question, correct_answer, wrong_answers)
  end
end