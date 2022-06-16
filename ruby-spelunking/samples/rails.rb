# frozen_string_literal: true

# Annoying example
class HiThere
  include HoThere

  def speak
    puts "Hello world"
  end
end

SupYo.new.speak
puts "fin."
