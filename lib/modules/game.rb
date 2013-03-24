class Game
  def initialize
    @answers = []
    @questions_and_answers = {}
    @missed_questions = []
    @questions_left = []
  end

  def add_question_and_answer(question, answer)
    @questions_and_answers[question] = answer
    @answers << answer

    # Add the question 3 times
    (1..3).each do
      @questions_left << question
    end
  end

  def next
    @questions_left.shuffle!
    return @questions_left.pop
  end
end