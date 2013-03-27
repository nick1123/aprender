class Game
  attr_reader :answers, :questions_and_answers, :questions_missed, :questions_original, :questions_answered
  attr_accessor :win_loss_streak

  MAX_STREAK = 8

  def initialize
    @answers               = []
    @questions_and_answers = {}
    @questions_answered    = 0
    @questions_missed      = []
    @questions_original    = []
    @win_loss_streak       = []
  end

  def add_answer(answer)
    @current_round.add_answer(answer)

    if !@current_round.completed
      # The answer was wrong
      @questions_missed << @current_round.question
    end
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
    if @current_round.blank?
      puts "*** @current_round.blank"
      @current_round = next_round
    end

    if @current_round.completed
      puts "*** @current_round.completed"
      @current_round = next_round
    end

    puts "*** @current_round.question:  #{@current_round.question}"
    puts "*** @current_round.object_id: #{@current_round.object_id}"
    puts @current_round.to_s
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

  # def start
  #   @current_round = next_round
  # end

private

  def next_round
    puts "*** Calling next round"
    update_streak
    question = question_for_next_round
    correct_answer = questions_and_answers[question]
    wrong_answers = []
    while wrong_answers.uniq.size < 3
      potential_wrong_answer = answers.sample
      wrong_answers << potential_wrong_answer if potential_wrong_answer != correct_answer
    end

    return GameRound.new(question, correct_answer, wrong_answers)
  end

  def question_for_next_round
    question = nil
    if questions_missed.present? && rand <= 0.6
      questions_missed.shuffle!
      question = questions_missed.pop
    else
      questions_original.shuffle!
      question = questions_original.pop
    end

    return question
  end

  def update_streak
    if @current_round.present?
      # win_loss_streak.shift if win_loss_streak.size >= MAX_STREAK
      puts "*** @current_round.outcome #{@current_round.outcome}"
      @win_loss_streak << @current_round.outcome
    end

  end

end