# frozen_string_literal: true

require "./speaker"

# Inherit example
class SupYo < Speaker
  def speak
    puts "Hello world"
  end
end

SupYo.new.speak
puts "fin."
