class Fact
  include Mongoid::Document
  field :body, type: String
  belongs_to :user_input
end
