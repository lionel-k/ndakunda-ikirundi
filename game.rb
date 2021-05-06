require 'csv'

table = CSV.parse(File.read('words.csv'), headers: true)

dictionary = table.map { |row| [ row['ki'], { fr: row['fr'], en: row['en'] } ] }.to_h
ki_words = dictionary.keys


language = 'fr'

guess = ki_words.sample
puts "guess : #{guess}"
answers = []
answers << dictionary[guess][:fr]
other_answers = dictionary.dup.tap { |h| h.delete(guess) }.values.map { |answer| answer[:fr] }
answers.concat(other_answers.sample(4))
puts "answers : #{answers.shuffle}"
