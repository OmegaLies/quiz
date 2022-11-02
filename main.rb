# encoding: UTF-8

require "rexml/document"
require "timeout"
require_relative "lib/question"
require_relative "lib/quiz"

puts "Мини-викторина. Ответьте на вопросы."
puts

file = File.new("#{__dir__}/data/questions.xml")
doc = REXML::Document.new(file)
file.close

questions = doc.root.elements.map do |question|
  Question.parse_xml(question)
end

quiz = Quiz.new(
  questions: questions,
  answers_count: 0,
  number_of_questions: 3,
  score: 0
)

quiz.generate.each do |question|
  puts question
  user_answer = -1
  Timeout::timeout(question.time) {
    user_answer = STDIN.gets.to_i
  }
  if user_answer == question.right_variant_id
    puts quiz.right_answer(question.points)
    puts
  else
    puts quiz.wrong_answer(question.answer)
    puts
  end
rescue Timeout::Error
  puts "Время на ответ вышло! Игра окончена"
end

puts quiz.result
