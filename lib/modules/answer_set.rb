class AnswerSet
  attr_reader :answers

  def initialize(_answers)
    @answers = _answers.map {|answer_text| Answer.new(answer_text)}
  end

  def matched_count
    (answers.select {|answer| answer.successfully_matched}).count
  end

  def record_answer(answer_text)
    answers.each {|answer| answer.try_to_match(answer_text) }
  end

end