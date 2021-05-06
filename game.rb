require 'csv'

table = CSV.parse(File.read('words.csv'), headers: true)

DICTIONARY = table.map { |row| [ row['ki'], { fr: row['fr'], en: row['en'] } ] }.to_h
KI_WORDS = DICTIONARY.keys


LANGUAGE = :en

running = true
total_rounds = 5
rounds = 0
results = 0

def get_guess
  guess = KI_WORDS.sample
  puts "guess : #{guess}"
  guess
end

def get_answers(guess)
  valid_answer = DICTIONARY[guess][LANGUAGE]
  other_answers = DICTIONARY.dup.tap { |h| h.delete(guess) }.values.map { |answer| answer[LANGUAGE] }
  answers = [valid_answer].concat(other_answers.sample(4)).shuffle
  puts "answers"
  puts answers.map.with_index { |word, index| "#{index + 1}. #{word}"}.join("\n")
  { all: answers, valid: valid_answer }
end

def valid_answer?(choice, answers)
  answers[:all][choice - 1] == answers[:valid]
end

puts "----------"
puts "Welcome"
puts "----------"

while running && rounds < total_rounds
  puts ''
  guess = get_guess
  answers = get_answers(guess)
  print "> "
  choice = gets.chomp.to_i
  # puts choice = rand(1..5)
  # puts choice = 5
  # puts choice = (rounds % 5) + 1
  valid = valid_answer?(choice, answers)
  results += 1 if valid
  rounds += 1
  running = choice != 0
end

puts ''
puts "Results: #{results * 100 / rounds} %"
