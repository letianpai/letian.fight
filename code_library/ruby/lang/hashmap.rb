#!/usr/bin/env ruby
# coding: utf-8

# 建立hash

months = Hash.new

# 使用 empty? 测试 Hash 是否为空
p months.empty?

# 使用 length, size返回 Hash的大小
p months.length
p months.size

# 如果指定了默认参数， 则当没有指定元素时候，则返回默认元素
months2 = Hash.new('abc')
p months2[:aa]

# 可以使用类方法[] 来建立一个 Hash.
months3 = Hash[:aaa, 10, :bbb, 20, :ccc, 30]
p months3[:aaa]

x = 'abc'
months3[x] = 1000 # 直接作为key , 就不能通过sym访问
months3[x.to_sym] = 1000
p months3[:abc]
p months3[x]


# 返回一个 hash 所有的key, 使用keys, 返回所有的key
p months3.keys
p months3.values

# 判断是否包含一个key
p months3.has_key?(:aaa)
p months3.has_value?(1000)

# 返回多个key 的值， 使用 values_at
# 这里 :ddd 返回 nil
p months3.values_at :aaa, :bbb, :ddd

# 通过某个 value 返回key , 使用 index
p months3.key 10

# 通过 select 方法， 使用一个block 来返回一个符合条件的新的多维数组

zip = { 82442 => "Ten Sleep", 83025 => "Teton Village", 83127 => "Thayne",
    82443 => "Thermopolis", 82084 => "Tie Siding", 82336 => "Tipton", 82240 =>
"Torrington", 83110 => "Turnerville", 83112 => "Turnerville" }

p zip.select { |key, val|  key > 83000 }

##
# 迭代 Hash
# 可以通过 each, each_key, each_value, each_pair 来迭代一个Hash
#
# each 方法对于hash 每一条数据调用一个 block:
#
zip.each{ |k, v| puts "#{k}/#{v}" }
puts
# each 和 each_pair 区别， each 可以有一个或者两个参数， 而 each_pair 必须有两个参数
zip.each_pair{ |k, v| puts "#{k}/#{v}" }

# each_key 方法只传递key 给block
zip.each_key{ |key| print key, " " }
# 同理， each_value 方法则只传递value 给block
zip.each_value{ |value| print value, " "}

##
# 修改 Hash
#
# Hash 的 []= 方法会替换/添加一个 key-value 的值给一个存在的 Hash
#
# 比如
rhode_island = { 1 => "Bristol", 2 => "kent", 3 => "Newport", 4 => "Providence", 5 => "Washington" }
# 使用 []= 来添加或修改一个值:
rhode_island[6] = "Dunthorpe"

p rhode_island

# 也可以使用 store 方法来添加值: 
rhode_island.store(7, "Seven")
p rhode_island

##
# 合并Hash
#
# 两个 hash:
#
delaware = { 1 => "kent", 2 => "New Castle", 3 => "Sussex" }
rhode_island = { 1 => "Bristol", 2 => "Kent" ,  3 => "Newport" , 4 => "Providence", 5 => "Washington" }

# merge 方法组合两个hash, 获得一份 hash 拷贝， 第二个hash 相同的key值会覆盖第一个
merge_arr = rhode_island.merge delaware
p merge_arr

##
# 排序Hash
#
# 当在一个 Hash 上使用 sort 方法， 将会返回一个key, value 构成的两个元素的二维数组，
# 注意： hash 本身是没有任何排序信息的

rhode_island = { 1 => "Bristol",  2 => "Kent" , 3 => "Newport" ,  4 => "Providence" , 5 => "Washington" }
p rhode_island
p rhode_island.sort #=> 注意 Hash没有sort! 方法

##
# 删除和清除一个 Hash
#
# 可以使用 delete 方法来删除一个 hash 的key->value, delete 方法使用一个key 来找到相应部分并且 destory 它
#
p rhode_island.delete(5)  #=> 返回删除的元素

# 也可以在调用 delete 的时候传入一个 block, 则在指定的key 不存在的时候， 返回block内容

rhode_island.delete(6) { |key| puts "not found key #{key}, bubba" }

# delete_if 方法也可以使用一个 block, 当block 里最后表达式结果为 true, 则对应的记录被删除
# 下面删除key 小于 3的记录
rhode_island.delete_if{|key, value| key < 3}
p rhode_island

# reject 方法类似 delete_if, 但是它返回hash中标识删除的备份， 并不修改原数据。 而reject!则和delete_if 相等

rhode_island = { 1 => "Bristol",  2 => "Kent" , 3 => "Newport" ,  4 => "Providence" , 5 => "Washington" }
puts "===="
p rhode_island.reject {|key, value| key < 3}


# 使用clear 方法会删除Hash 内所有数据， 删除后数据为 empty
counties = {"delavars" => 3,  "Rhode Island" => 5}
counties.clear
p counties.empty? # => true

##
# 替换 Hash
#
# 如果要替换一个 hash 的全部内容， 使用replace 方法:
temp = {"delaware" => 3}
counties.replace(temp)
p counties
p counties.replace({"delaware" => 4})

##
# 转换 Hash 为其他类型
#
# 可以通过 to_a 把 Hash 转换为一个数组
fitzgerald = {1920 => "This Side of Paradise", 1925 => "The Geet Gateby", 
	          1934 => "Tender Is ths Night"}
# 使用 to_a 转换为数组
p fitzgerald.to_a

# to_a 转换一个 hash 为一个多维数组， hash 的key=value 值被转换为两个元素的数组值
# 通过 to_s 转换一个 hash 为一个字符串:

novels = fitzgerald.to_s 
p novels  # "{1920=>\"This Side of Paradise\", 1925=>\"The Geet Gateby\", 1934=>\"Tender Is ths Night\"}"

# 给数组使用 to_hash 则不会生成新hash ,两个内容的 object_id 相等





