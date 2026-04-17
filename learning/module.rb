
# Module
# Last included/prepended module appears first in the chain
# hook will be called when include, prepend or extend a module
# - self.prepended(base)
# - self.included(base)
# can be used as namespace as well
# nested modules can be defined

# A mixin is when a module is used to add behavior to a class.
    # this is done using
    #   included
    #   prepend
    #   extend

#module_function is used to call a methods with module name

# Class Variables (@@): Shared across the entire inheritance hierarchy. If a child changes it, it changes for the parent too.

# Modules are the primary way to share attributes accross uunrelated clases
module Recordable
  attr_accessor :serial_number

end

class Camera
  include Recordable
  def initialize
    @serial_number = "camera serial_number"
  end
end

class Phone
  include Recordable

  def initialize
    @serial_number = "phone serial_number"
  end
end

p Camera.new.serial_number
p Phone.new.serial_number

module M1
  def self.prepended(base)
    p "#{base} INCLUDED MODULE M1"
  end

  def test
    puts "M1#test (Parent prepend module)"
    super
  end

  def add(a,b)
    p a+b
  end

  module_function :add
end

M1.add(11,2) # act like a class method


module M2
  def self.included(base)
    p "#{base} INCLUDED MODULE M2"
  end

  def test
    puts "M2#test (Parent include module)"
  end
end

module M3

  def self.prepended(base)
    p "#{base} prepended MODULE M3"
  end

  def test
    puts "M3#test (Child prepend module)"
    super
  end
end

module M4
  def self.included(base)
    p "#{base} INCLUDED MODULE M4"
  end

  def test
    puts "M4#test (Child include module)"
    super
  end
end

module M5
  def self.extended(base)
    p "#{base} extended M5"
  end
  def test
    puts "extended module"
  end
end

class Parent
  #  prepend M1
  # include M2
  def test
    puts "Parent#test (Parent class)"
    super
  end
end

class Child < Parent
# Last included/prepended module appears first in the chain
  prepend M3
  prepend M1
  include M4
  include M2
  extend M5

  def test
    puts "Child#test (Child class)"
    super
  end
end

 # puts Child.ancestors
# Child.new.test


# module as Namespace

module Payment
  class Processor
    def pay
      puts "Payment processed"
    end
  end
end

Payment::Processor.new.pay


# Class Variables (@@): Shared across the entire inheritance hierarchy. 
# If a child changes it, it changes for the parent too.
class Application
  @@theme = "Light Mode"

  def self.theme
    @@theme
  end
end

class AdminPanel < Application
  def self.change_theme(new_theme)
    @@theme = new_theme
  end
end

# 1. Check the initial state
puts "Original Parent Theme: #{Application.theme}" # => Light Mode

# 2. Change the theme from the CHILD class
AdminPanel.change_theme("Dark Mode")

# 3. Check the PARENT state again
puts "AdminPanel Theme: #{AdminPanel.theme}"      # => Dark Mode
puts "Parent Application Theme: #{Application.theme}" # => Dark Mode (It changed!)