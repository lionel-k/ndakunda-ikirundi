require 'csv'
require 'pry'

simple = CSV.parse(File.read('simple-words.csv'), headers: true)
DICTIONARY = simple.map { |row| [ row['ki'].upcase, { fr: row['fr'], en: row['en'] } ] }.to_h
SIMPLE_WORDS = DICTIONARY.keys

DIFFICULT_WORDS = CSV.parse(File.read('difficult-words.csv'), headers: true).to_a

WORDS = (SIMPLE_WORDS + DIFFICULT_WORDS).shuffle

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

def word_match
  SIMPLE_WORDS.sample(4).each do |word|
    puts word
    puts SIMPLE_WORDS.sample(2)
    puts '-' * 20
  end
end

# word_scramble(min_size: 8, size_sample: 4)
# word_search(min_size: 5, size_sample: 7)
word_match
