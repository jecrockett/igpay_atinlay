require 'pry'

def punctuated?(message)
  message.chars.last == ("?") || message.chars.last == ("!")
end

def first_three_match(word)
  CONSONANT_CLUSTERS.include?(word[0..2])
end

def first_two_match(word)
  CONSONANT_CLUSTERS.include?(word[0..1])
end

def convert_to_pig_latin(message)
  punctuation = message.slice!(-1) if punctuated?(message)
  converted_message = message.split.map do |word|
    if VOWELS.include?(word[0])
      word + "yay"
    elsif CONSONANT_CLUSTERS.include?(word[0..1]) || CONSONANT_CLUSTERS.include?(word[0..2])
      slice = word.slice!(0..2) if first_three_match(word)
      slice = word.slice!(0..1) if first_two_match(word)
      word + slice + "ay"
    else
      slice = word.slice!(0)
      word + slice + "ay"
    end
  end
  converted_message.join(' ') + punctuation.to_s
end

VOWELS = ["a", "e", "i", "o", "u"]
CONSONANT_CLUSTERS = ["bl", "br", "ch","cr", "cl", "dr", "dw", "fl", "fr", "gl", "gr", "kn", "gw", "pl", "pr", "qu", "sc", "scr", "sh", "shr", "sk", "sl","sm", "sn", "sp", "sph", "spl", "spr", "st", "str", "squ", "sw", "th", "thr", "thw", "tr", "tw"]


if File.identical?(__FILE__, $0)
  loop do
    puts "What would you like to convert to pig latin?"
    message = gets.chomp.downcase

    puts convert_to_pig_latin(message)

    puts "Would you like to convert another message?"
    answer = gets.chomp
    break if answer[0].downcase == "n"
  end
end
