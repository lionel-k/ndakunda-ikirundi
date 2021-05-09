require 'csv'

table = CSV.parse(File.read('words.csv'), headers: true)

DICTIONARY = table.map { |row| [ row['ki'], { fr: row['fr'], en: row['en'] } ] }.to_h
KI_WORDS = DICTIONARY.keys


puts KI_WORDS.sample(15)
