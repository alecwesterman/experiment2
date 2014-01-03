class Verb < Word
  include Mongoid::Document
  has_many :descriptors
  has_one :noun
end
