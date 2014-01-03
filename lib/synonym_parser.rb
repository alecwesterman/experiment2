require 'open-uri'

class SynonymParser
  def self.create_word_instance(word)
    if ["is", "has"].include?(word.downcase)
      return Verb.create(name: word)
    end
    
    begin
      unparsed = open('http://words.bighugelabs.com/api/2/4051d1fcf3fbc106302f69d9769db824/'<<word<<'/json').read
    rescue
      return  Noun.create(name: word)
    end

    parsed = JSON.parse(unparsed)
    part_of_speech = parsed.keys[0]
    synonyms = parsed[part_of_speech].values[0]
    if part_of_speech == "verb"
      return  Verb.create(name: word)
    elsif part_of_speech == "noun"
      return  Noun.create(name: word)
    end
  end
end
