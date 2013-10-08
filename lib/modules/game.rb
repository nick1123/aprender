class Game
  attr_reader :extra_rounds,
              :current_round,
              :normal_rounds,
              :round_factory

  def initialize(_rounds, _round_factory)
    @normal_rounds = _rounds
    @round_factory = _round_factory
    @extra_rounds  = []
    load_next_round
  end

  def answered_correctly?(selected_answer)
    if current_round.answered_correctly?(selected_answer)
      load_next_round
      return true 
    end
    
    # They answered incorrectly
    question = current_round.question
    
    normal_rounds << round_factory.build_single_round(question)
    extra_rounds  << round_factory.build_single_round(question)
    
    normal_rounds.shuffle!
    extra_rounds.shuffle!

    return false
  end

  def questions_remaining
    normal_rounds.size + extra_rounds.size
  end

  private

  def load_next_round
    if extra_rounds.empty? && normal_rounds.empty?
      @current_round = nil
    else
      # Choose a round from 1 of the 2 arrays of rounds
      round_arrays = []
      round_arrays << normal_rounds if normal_rounds.present?
      round_arrays << extra_rounds  if extra_rounds.present?
      array = round_arrays.sample
      @current_round = array.pop
    end
  end

end
