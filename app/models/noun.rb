class Noun
  include Mongoid::Document
  field :name
  field :number, type: Integer
  has_many :descriptors
  has_one :verb
end
