require 'csv'
require 'pry'

simple = CSV.parse(File.read('simple-words.csv'), headers: true)
DICTIONARY = simple.map { |row| [ row['ki'].upcase, { fr: row['fr'], en: row['en'] } ] }.to_h
simple_words = DICTIONARY.keys

difficult_words = CSV.parse(File.read('difficult-words.csv'), headers: true).to_a

WORDS = (simple_words + difficult_words).shuffle

def mix_letters(word)
  word.upcase.chars.shuffle.join('')
end

def words(min_size)
  WORDS.select { |word| word.size > min_size }
end

def word_scramble(min_size:, size_sample:)
  words = words(min_size).sample(size_sample)
  puts words
  puts '-' * 20
  words.each do |word|
    puts mix_letters(word)
  end
end

def word_search(min_size:, size_sample:)
  words = words(min_size).sample(size_sample)
  puts words
end

word_scramble(min_size: 8, size_sample: 4)
word_search(min_size: 5, size_sample: 10)

