class Quiz
  def initialize(params)
    @questions = params[:questions]
    @answers_count = params[:answers_count]
    @number_of_questions = params[:number_of_questions]
    @score = params[:score]
  end

  def generate
    @questions.sample(@number_of_questions)
  end

  def right_answer(points)
    @answers_count += 1
    @score += points
    "Верный ответ!"
  end

  def wrong_answer(right_answer)
    "Неверно. Правильный ответ: #{right_answer}"
  end

  def result
    <<~RESULT
      Правильных ответов: #{@answers_count} из #{@number_of_questions}
      Вы набрали #{@score} баллов
    RESULT
  end
end
