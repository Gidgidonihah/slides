# frozen_string_literal: true

require "pry"
require "pry-byebug"
require "./modules"

# Pry example
class Pry
  binding.pry
  include Helpers
  include Hurters

  def speak
    binding.pry
    puts "Hello world"
  end
end

Pry.new.speak
