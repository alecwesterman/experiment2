class UserInput
  include Mongoid::Document
  field :body, type: String
  has_many :facts
end
