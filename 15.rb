=begin

Chapter 15. Use Modules as Name Spaces

* A Ruby module is the container part of a class without the factory.
* You can’t instantiate a module, but you can put things inside of a module.
* Modules can hold methods, constants, classes, and even other modules.


What are Modules good for?

1. They can help divid your code into manageable parts
2. They can contain classes and constants, individual methods,
   and even other modules inside of modules, as well as how
   to access the things inside of a module.
3. They can be treated like other objects

=end

##################################################
#1 Help manage your code by organizing your classes
##################################################

module Rendering
  class Font
    attr_accessor :name, :weight, :size

    def initialize( name, weight=:normal, size=10 )
      @name = name
      @weight = weight
      @size = size
    end
  end

  class PaperSize
    attr_accessor :name, :width, :height

    def initialize( name='US Let', width=8.5, height=11.0 )
      @name = name
       @width = width
      @height = height
    end
  end
end

##################################################
#2 Help set constants
##################################################

module Rendering
  DEFAULT_FONT = Font.new( 'default' )
  DEFAULT_PAPER_SIZE = PaperSize.new
end

##################################################
#3 Access Constains in the module
##################################################

Rendering::DEFAULT_PAPER_SIZE.width

#or

module test
  include Rendering
  "test #{DEFAULT_PAPER_SIZE.width}"
end

##################################################
#4 Create utility methods
##################################################

module WordProcessor
  def self.points_to_inches( points )
    points / 72.0
  end
end

WordProcessor::points_to_inches(1)

##################################################
#5 Modules are objects
##################################################

the_module = Rendering
the_module::DEFAULT_PAPER_SIZE.width


##################################################
=begin

Tips:

If you find yourself prefixing your classes like...
- class CoolToolMain
- class CoolToolHelp
Then put them in a CoolTool module

BUT Dont go module crazy...
Subsystem::Output::Rendering::Foo:Bar

=end

