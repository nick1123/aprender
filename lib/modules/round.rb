class Round
  attr_reader :answers_added, :completed, :correct_answer, :possible_answers, :question

  def initialize(_question, _correct_answer, _wrong_answers)
    @answers_added    = 0
    @completed        = false
    @correct_answer   = _correct_answer
    @possible_answers = (_wrong_answers << _correct_answer).shuffle.map {|answer| Answer.new(answer)}
    @question         = _question
  end

  def add_answer(answer)
    @answers_added += 1
    @completed = true if answer == correct_answer

    # Record this answer
    possible_answers.each do |possible_answer|
      if possible_answer.text == answer
        possible_answer.previously_selected = true
      end
    end
  end

end
