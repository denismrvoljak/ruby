module Greetable
  def greet
    "Hello #{name}"
  end

end

class User
  attr_accessor :name
  include Greetable
end

user = User.new
user.name = "Denis"
puts user.greet
