=begin

Chapter 16. Use Modules as Mixins


=end


module MixinMethods
  def shrug
    "¯\_(ツ)_/¯"
  end
end


#How do I include a module to my class to use?

class MyClass1
  include MixinMethods

  def test
    MixinMethods.shrug
  end
end

MyClass.new.test



#Extend (pseudo class)
module Say
  def my_name(name)
    "Hello #{name}"
  end
end

class MyClassWithoutExtend
  class << self
    include Say
  end
end

MyClassWithoutExtend.my_name "Justin" #=> "Hello Justin"

#or

class MyClassExtend
  extend Say
end

MyClassExtend.my_name "Justin" #=> "Hello Justin"


#Now your Class Hierarchy and stay out of trouble
module Module1; end


class TestLoad
  include MixinMethods
  include Module1

end

TestLoad.ancestors #=> [TestLoad, MixinMethods, Module1, Object, Kernel, BasicObject]
TestLoad.new.kind_of? MixinMethods #=> true


#Module Examples:

#1. DataMapper is a module that is included
#2. Rails Helpers
#3. Mixins are good for stashing Constants into like sqlite3 does

module ErrorCodes
  OK = 0
  ERROR = 1
end

class SqlApp
  include ErrorCodes

  def status (code)
    "ok" if OK == code
  end
end

SqlApp.new.status 0 #=> "ok"


#Modules are like Phantom Superclasses.
