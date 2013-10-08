class Fact
  include Mongoid::Document
  field :body, type: String
  field :number, type: Float
  belongs_to :user_input

  def self.create_facts(user_input)
    period_chunks = user_input.body.split('.').reject(&:empty?)
    period_chunks.each do |period_chunk|
      fact = "- "
      sentence = period_chunk.split('?').last
      # sentence.slice!("the ")
      # sentence.slice!("The ")
      # sentence.slice!("that ")
      # sentence.slice!("That ")
      number_array = []
      sentence.split(' ').each do |word|
        number = Parser.to_number(word)

        if number.present?
          
          number_array << number
        else
          unless number_array.empty?
            Fact.create(body: word, number: number_array.sum, user_input: user_input)
          else
            Fact.create(body: word, user_input: user_input)
          end
        end
      end
      unless number_array.empty?
        binding.pry
        Fact.create(body: "last numb", number: number_array.sum, user_input: user_input)
      end

    end
  end
end
