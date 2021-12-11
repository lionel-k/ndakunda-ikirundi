require 'csv'

table = CSV.parse(File.read('words.csv'), headers: true)

DICTIONARY = table.map { |row| [ row['ki'].upcase, { fr: row['fr'], en: row['en'] } ] }.to_h
KI_WORDS = DICTIONARY.keys

def mix_letters(word)
  word.upcase.chars.shuffle.join(' ')
end

words = KI_WORDS.sample(5)
puts words

words.each do |word|
  puts mix_letters(word)
end


# INGONA
# IGITOKE
# UMUKATE
# INZOVU
# AGAHUNGAREMA

N A G O N I
I T K E O I G
K M A T E U U
O N Z V U I
G A E R U A A N M H G A
