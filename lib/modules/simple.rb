class Simple
  def self.usa_state_capitals
    build_game("m000001_usa_state_capitals.tsv")
  end

private

  def self.build_game(file_name)
    lines = IO.readlines("lib/data/#{file_name}")
    game = Game.new

    lines.each do |line|
      pieces = line.strip.split("\t")
      question = pieces[0]
      answer = pieces[1]
      game.add_question_and_answer(question, answer)
    end

    return game
  end

end