require 'csv'
require 'pry'

simple = CSV.parse(File.read('simple-words.csv'), headers: true)
difficult = CSV.parse(File.read('difficult-words.csv'), headers: true)

# DICTIONARY = table.map { |row| [ row['ki'].upcase, { fr: row['fr'], en: row['en'] } ] }.to_h
# KI_WORDS = DICTIONARY.keys

def mix_letters(word)
  word.upcase.chars.shuffle.join(' ')
end

words = difficult.to_a.flatten.select { |word| word.size > 5 }.sample(5)
puts words

words.each do |word|
  puts mix_letters(word)
end


# INGONA
# IGITOKE
# UMUKATE
# INZOVU
# AGAHUNGAREMA

# N A G O N I
# I T K E O I G
# K M A T E U U
# O N Z V U I
# G A E R U A A N M H G A




IJAMBO
UBWIZA
KUGWIRA
IMPWEMU
UMUTWARE
INYAMA
UBWENGE

