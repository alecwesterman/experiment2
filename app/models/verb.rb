class Verb
  include Mongoid::Document
  field :name
  has_many :descriptors
  has_one :noun
end
