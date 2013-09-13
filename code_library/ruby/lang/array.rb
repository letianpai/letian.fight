#!/usr/bin/ruby
# coding:utf-8

##
# ruby 数组操作 sample
# 
## 
#建立数组
##

# 建立一个空数组
months = Array.new 
months2 = []

p months
p months2
p months.empty?

# 建立数组时，可以初始化数组的大小
# 这种方式建立一个长度12 的数组， 初始化值为 nil
months = Array.new(12)
p months
p months.size
# 相当于 p months
puts months.inspect

# 使用 new 时可以使用第二个参数来初始化元素的值
month = Array.new(12, "month")
p month

##
# 清除数组
## 
## 使用clear 清除整个数组, 不能用clear清除整个数组
months.clear # => []
p months.empty? # => true

## 使用 block 构建一个 Array
rum = Array.new(10) { |e| e = e *2}
p rum

## 使用Array 的 []方法 建立数组
month_abbrv = Array.[]( "jan", "feb", "mar", "apr" , "may", "jun", "jul", "aug", "sep", "oct", "nov" ,"dec") 
p month_abbrv

## 同样， 直接写在 [] 里:
month_abbrv = Array["jan", "feb", "mar", "apr" , "may", "jun", "jul", "aug", "sep", "oct", "nov" ,"dec"]
p month_abbrv

## 可以通过范围符号 ".." 直接建立一个范围数组
digits = Array(0..9)
p digits

## 使用 %w 来quote 数组里的值， 把数组值变为字符串数组
months =  %w[ nil January February March Aprll May June August July August]
p months #=>["nil", "January", "February", "March", "Aprll", "May", "June", "August", "July", "August"]

#使用 each 来迭代数组
months.each {|e| print e.class, " "}


##
#  访问数组
#
##
q1 = %w[ January February March]
puts
p q1

# 可以使用[] 和数字索引访问元素， 
p q1[0] #=> January
p q1[2] #=>March

# 也可以使用at 方法
p q1.at(0) #=>January

# 访问数组最后一个元素
# 通过负数可以从后开始访问元素， 以此类推
p q1[-1]  # => March
p q1[-2]

# 获得一个数组的第一个和最后一个
p q1.first
# 可以给出一个整形参数， 表示返回数组的数量
p q1.last 0

# 使用 index 获取一个元素的索引位置，如果没有找到，返回nil
p q1.index "March" # => 2

# 使用 rindex ,则返回最后符合的元素
q1 = %w[ March January February March ]
p q1.rindex "March" #=> 3

## 获取数组范围

year = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009]

# 指定元素开始位置和获取长度
p year[0, 3] #= > [2000, 2001, 2002]

# 使用范围操作符
p year[7..9] #=>[2007, 2008, 2009]
p year[7...9]

# 可以使用slice 替代 []
p year.slice(1)
p year.slice(0, 4)
p year.slice(0..2)

## 如果判断一个数组是否包含一个元素， 使用 include?
p year.include? 2004  #=> true
p year.include? 2010  #=> false

####
# 合并数组
####
# 使用 + 操作符连接数组
q1 = Array.new(5) {|x| x = x+1 }
q2 = Array(6..9)  
q3 = q1 + q2
p q3

# 可以使用 << 方法添加元素, 类似 push
q3 << 11 << 12 << 13
p q3

# 可以使用concat 方法来合并数组(相当于 +)
last_part = q3.concat(q2)
p last_part

####
# 数组集合操作
#
####
# ruby 对数组提供了一些集合方法
# 交集使用 & 差集使用 -  并集使用 |
# 交集建立一个新数组， 合并两个数组的元素， 并删除两个元素的不重复元素
tue = [ "shop", "make pie", "sleep" ]
wed = [ "shop", "make pie", "read", "sleep"]
p tue & wed

# 差集建立一个新数组， 删除第二个元素中存在的数据
p wed - tue # => ["read"]

# 并集(|) 合并两个数组， 并删除重复值(+) 不会删除重复值
p wed | tue

# 如果要处理苏组的集合对象， 可以使用 Ruby 的Set 类

####
#  使用 uniq 方法进行数组去重
####
# uniq 方法会删除一个数组里的重复元素， 建立一个新数组， 同样 uniq! 会修改原数组
shopping_list = %w[ cheese break crackers potatoes carrots cheese ]
p shopping_list.uniq

####
# 数组作为栈使用
####
# 使用数组模拟堆栈使用, 使用后入先出 (LIFO) ， 使用数组的 push 和 pop方法
fruit = %w[ apple crange banana ]
p fruit.pop # =>  "banana"
p fruit
fruit.push "mango"
p fruit  # => ["apple", "orange", "mango" ]

####
# 比较数组
####
## 有三个方法可以用来比较数组是否相等： ==， 《==》 和 eql?
bob = ["full", 40, "yes"]
lou = ["part", 23, "no"]
schlomo = ["full", 40, "yes"]

# 使用 == 比较两个数组是否相等:
# 数组相等表示: 1. 两个数组包括同样数量的元素， 2. 每个数组的元素内容必须相等（顺序也得相等)
p lou == lou #=> true
p bob == schlomo #=> true
p schlomo == lou #=> false

# eql? 和 === 不同， eql? 不止检查值是否相等，还检查值的类型
# 使用 <=> 太空船比较符进行比较
p lou <=> lou # => 0
p bob <=> lou #=> -1
p lou <=> schlomo #=> 1

####
#  修改数组元素
####
months = %w[ nil January February March April May June July August September October November December ]
p months 

# 通过 insert 在指定位置插入元素
months =  months.slice(1..-1)
months.insert(0, nil)
p months

# 通过 slice , [n...m] 修改数组中一定范围的元素
months[5..7] = "Mai", "Jun1", "Juli" 
p months

# 也可以使用 [start, len] 的方式替换
months[5, 3] = "--May", "June", "July"
p months

####
#  转换数组为字符串
####
## 使用join 方法， 把数组所有元素组合成一个字符串
greeting = ["Hello! ", "Bonjour! ", "Guten Tag!" ]
puts greeting.join 

#使用 join 第二个参数，设置组合的分割符号
months = %w[ January February March April May June July August September October November December ]
p months.join ", "

# 可以使用 compact 去掉数组里值为 nil 的元素
hasNil = [nil , "test1", nil, "test2"]
p hasNil.compact

####
# 使用 shift 和unshift 
####
# 使用shift 来从数组地步获取数据（和pop 相反), 如果数组为空，返回nil, 使用unshift 在地步放入数据
datas = [4,5,6,7]
p datas.shift #=> 4
p datas #= [5,6,8]
datas.clear
p datas.shift # => nil

####
#  使用each + block 迭代一个数组
#  使用 map 则根据 block 返回一个新数组
####
months = months.each {|v|  v= 'xxx'}
p months  # => 没有变化 
months2 = months.map {|v| v = 'xxx'}
p months2  # => 新数组包含'xxx'

## 使用 each_index 迭代 key
months.each_index {|i| puts 'key:' + i.to_s + ' value:' + months[i] } 


####
#  数组的排序
####
x = [2, 4, 1, 7 , 23, 99, 14, 27]
# 可以使用 select 进行filter
p x.select { |v| v % 2 == 0 }
# 使用sort 或者 sort! 来进行k
p x.sort! # => [1 , 2 , 4, 7, 14, 23, 27, 99]
# 这里要求元素必须能够可比较.

# 使用reverse 或者 reverse！来翻转数组的顺序
x.reverse!
p x

####
# 多维数组
####
# 多维数组就是数组的数组，直接定义多维数组
d2 = [ ["january", 2007],
       ["February", 2007],
       ["March", 2007], ]
p d2

# 使用 flatten, flatten! 平行化为一维数组
p d2.flatten #=>  ["january", 2007, "February", 2007, "March", 2007]
# flatten  可以给一个整形参数表示平行化级别
d2.push ['1', ['2']]
p d2.flatten 1 #=> ["january", 2007, "February", 2007, "March", 2007, "1", ["2"]]

# 可以把二维数组作为一个 行列数据， 然后可以使用 transpose 方法来行列转换

d2 = [ ["January", 2007], ["February", 2007], ["March", 2007] ]
p d2.transpose #=> ["January", "February", "March"], [2007, 2007, 2007]]

