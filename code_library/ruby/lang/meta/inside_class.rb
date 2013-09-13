#!/usr/bin/env ruby
# coding: utf-8

3.times  do
	class C
       puts "Hello"
	end
end


## 不多说了，开放类~~~
class D
    def x; 'x' ; end
end

class D
	def y; 'y' ; end
end

obj = D.new
p obj.x
p obj.y

# 在某种意义上，  class 关键字在Ruby更像一个范围操作符， 
# 对于class 来说， 核心工作是把你放入类的上下文中。 

