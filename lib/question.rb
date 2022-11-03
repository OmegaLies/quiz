class Question
  attr_reader :text, :variants, :right_variant_id, :points, :time

  def initialize(params)
    @text = params[:text]
    @variants = params[:variants]
    @right_variant_id = params[:right_variant_id]
    @points = params[:points]
    @time = params[:time]
  end

  def answer
    @variants[@right_variant_id - 1]
  end

  def to_s
    result = @variants.map.with_index(1) { |variants, index| "#{index}. #{variants}" }
    <<~RESULT
      #{@text}
      Время на ответ - #{@time} секунд.
      #{result.join("\n")}
    RESULT
  end
end
