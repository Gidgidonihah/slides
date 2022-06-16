# frozen_string_literal: true

require "./helpers"

# Include example
class SupYo
  include Helpers

  def speak
    puts "Hello world"
  end
end

SupYo.new.speak
puts "fin."
