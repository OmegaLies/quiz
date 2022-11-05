# encoding: UTF-8

require "timeout"
require_relative "lib/question_parser"
require_relative "lib/question"
require_relative "lib/quiz"

puts "Мини-викторина. Ответьте на вопросы."
puts
questions = QuestionsParser.from_xml(File.read("#{__dir__}/data/questions.xml"))
quiz = Quiz.new(
  questions: questions,
  answers_count: 0,
  number_of_questions: 3,
  score: 0
)
quiz.generate.each do |question|
  puts question
  user_answer = -1
  Timeout::timeout(question.time) { user_answer = STDIN.gets.to_i }
  puts quiz.process_right_answer(question, user_answer)
  puts
rescue Timeout::Error
  puts "Время на ответ вышло! Игра окончена"
  break
end
puts quiz.result
