class Noun < Word
  include Mongoid::Document
  field :number, type: Float
  has_many :descriptors
  has_one :verb
  belongs_to :fact
end
