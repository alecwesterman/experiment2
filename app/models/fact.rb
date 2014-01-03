class Fact
  include Mongoid::Document
  field :number, type: Float 
  belongs_to :user_input
  has_many :nouns

  def self.create_facts(user_input)
    sentences = Fact.separate_out_sentences(user_input)
    sentences.each do |sentence|


      #number_array = []
      #number = Parser.to_number(word)

      # if number.present?
      #   number_array << number
      # else
      #   unless number_array.empty?
      #     Fact.construct_number(number_array)
      #     number_array = []
      #   else
      #     Fact.create(body: word, user_input: user_input)
      #   end
      # end

      word_array = []
      noun_array = []
      last_word = nil
      not_needed = ["the", "that", "a", "an"]
      sentence.split(' ').each do |word|
        unless not_needed.include?(word.downcase)
          word_instance = SynonymParser.create_word_instance(word)
          #Fact.makes_connections(last_word, word_instance)

          if word_instance.instance_of?(Noun)
            noun_array << Noun.last
          end
        end
      end

      # unless number_array.empty?
      #   Fact.construct_number(number_array)
      # end
      
      # body = "Placeholder Title"
      # noun_array.each do |noun|
      #   body << "\n- " + noun.name
      # end
      
      Fact.create(nouns: noun_array, user_input: user_input)
      binding.pry
    end
  end
  def self.construct_number(number_array)
    if number_array.size < 3
      Fact.create(body: "number", number: number_array.sum, user_input: user_input)
    else
      #number = number_array[-2...] re import

      number_array[0..-2].each_by(2) do |x,y|
        number += x*y
      end 
      Fact.create(body: "number", number: number, user_input: user_input)
    end
  end

  private

    def self.separate_out_sentences(input)
      sentences = []
      period_chunks = input.body.split('.').reject(&:empty?)
      period_chunks.each do |period_chunk|    
        sentences << period_chunk.split('?').reject(&:empty?) .last
      end
      return sentences
    end
    def self.makes_connections(last_word, word_instance)
      if last_word.present?
        if last_word.part_of_speech == "adjective" || last_word.part_of_speech == "adverb"
            last_word.acts_on = word_instance
        elsif last_word.part_of_speech == "noun"
          if word_instance.part_of_speech == "verb"
            last_word.acts_on = word_instance
          end
        elsif last_word.part_of_speech == "verb"
          if word_instance.part_of_speech == "noun"
            last_word.acts_on = word_instance
          end
        end
      end
    end
end


