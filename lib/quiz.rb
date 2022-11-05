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

  def process_right_answer(question, answer)
    if question.right_answer?(answer)
      @answers_count += 1
      @score += question.points
      "Верный ответ!"
    else
      "Неверно. Правильный ответ: #{question.answer}"
    end
  end

  def result
    <<~RESULT
      Правильных ответов: #{@answers_count} из #{@number_of_questions}
      Вы набрали #{@score} баллов
    RESULT
  end
end
