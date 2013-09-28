class Game
  attr_reader :extra_rounds,
              :normal_rounds,
              :round_factory

  def initialize(_rounds, _round_factory)
    @normal_rounds = _rounds
    @round_factory = _round_factory
    @extra_rounds  = []
  end

  def answered_correctly?(suggested_answer)
    return true if answered_correctly?(suggested_answer)
    
    # They answered incorrectly
    question = @current_round.question
    normal_rounds << round_factory.build_single_round(question)
    extra_rounds  << round_factory.build_single_round(question)
    return false
  end

  def next_round
    if extra_rounds.empty? && normal_rounds.empty?
      @current_round = nil
      return @current_round
    end

    round_arrays = []
    round_arrays << normal_rounds if normal_rounds.present?
    round_arrays << extra_rounds  if extra_rounds.present?
    array = round_arrays.sample
    @current_round = array.pop
    return @current_round
  end

end
