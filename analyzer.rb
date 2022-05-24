# analyzer.rb -- Text Analyzer

stopwords = %w[the a by on for of are with just but and to the my I has some in]
lines = File.readlines(ARGV.first)
line_count = lines.size
text = lines.join

# Count the words, characters, paragraphs and sentences
word_count = text.split.size
characters_count = text.size
characters_count_nospaces = text.gsub(/\s+/, "").size
paragraph_count = text.split(/\n\n/).size.to_f
sentence_count = text.split(/\.|\?|!/).size

# Make a list of words in the text that aren't stop words,
# Count them, and work out the percentage of non-stop words
# against all words
all_words = text.scan(/\w+/)
good_words = all_words.reject { |word| stopwords.include?(word) }
good_percentage = ((good_words.size.to_f / all_words.size.to_f) * 100).to_i

# Summarize the text by cherry picking some choice
sentences = text.gsub(/\s+/, " ").strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.size }
one_third = sentences_sorted.size / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

# Give the analysis back to the user
puts "#{line_count} lines"
puts "#{characters_count} characters"
puts "#{characters_count_nospaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{good_percentage}% of words are non-fluff words"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"
