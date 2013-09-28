class Simple

  # Returns a loaded game
  def usa_state_capitals
    build_game("m000001_usa_state_capitals.tsv")
  end

private

  def build_game(file_name)
    questions_with_answers = load_questions_and_answers(file_name)
    round_factory = RoundFactory.new(questions_with_answers)
    rounds = build_rounds(round_factory)
    return Game.new(rounds, round_factory)
  end

  def build_rounds(round_factory)
    rounds = []
    (1..3).each { rounds.concat(round_factory.build_rounds_for_all_questions) }
    return rounds.shuffle
  end

  def load_questions_and_answers(file_name)
    questions_with_answers = {}

    IO.readlines("lib/data/#{file_name}").each do |line|
      pieces = line.strip.split("\t")
      question = pieces[0]
      answer   = pieces[1]
      questions_with_answers[question] = answer
    end

    return questions_with_answers
  end
end

