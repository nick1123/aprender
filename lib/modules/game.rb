class Game
  attr_reader :answers, :questions_and_answers, :questions_missed, :questions_original, :questions_answered

  def initialize
    @answers               = []
    @current_round         = nil
    @questions_and_answers = {}
    @questions_answered    = 0
    @questions_missed      = []
    @questions_original    = []
  end

  def add_answer(answer)
    @current_round.add_answer(answer)    
  end

  def add_question_and_answer(question, answer)
    @questions_and_answers[question] = answer
    @answers << answer

    # Add the question 2 times
    (1..2).each do
      @questions_original << question
    end
  end

  def round
    @current_round = next_round if @current_round.blank?
    @current_round = next_round if @current_round.completed
    return @current_round
  end

  def finished?
    questions_left == 0
  end

  def more?
    !finished?
  end

  def questions_left
    questions_original.size + questions_missed.size
  end

private

  def next_round
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