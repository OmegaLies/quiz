def parse_xml(file)
  REXML::Document.new(file).root.elements.map do |question|
    Question.new(
      text: question.elements["text"].text,
      variants: question.elements["variants"].elements.map(&:text),
      right_variant_id: question.attributes["right"].to_i,
      points: question["points"].to_i,
      time: question["time"].to_i
    )
  end
end

