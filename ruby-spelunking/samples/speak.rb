# frozen_string_literal: true

# Method example
class Hello
  def puts(_msg)
    print "Uh, Uh, Uh. You didn't say the magic word!"
  end

  puts "#{__FILE__}:#{__LINE__}"

  def speak
    puts "Hello from an instance method."
  end
end

Hello.new.speak
puts "fin."
