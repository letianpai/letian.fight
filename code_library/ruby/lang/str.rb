#!/usr/bin/ruby
# encoding:utf-8
#
#  字符串处理 sample 
#

## 
# {{{ 获取部分字符串
#

str = String.new('this is my string')

puts str.length
puts str.size
# 直接可以判断返回
p str['this']
p str['nothing']

# 在 1.9 之前， 会返回ord 值，现在直接返回 chr值
# str[0]
p str[0] # => 't'

# 使用clear 清除字符串， 使用 empty? 判断字符串是否为空
str.clear()
puts "emtpy" if str.empty?() 


## 使用通用定位符
tmp_str = "aaa"
str = %Q(#{tmp_str}) #=> aaa
puts str

str = %q(#{tmp_str}) #=> #{tmp_str}
puts str

# x 表示包含命令行
ret = %x!ls -l!
puts ret

### HERE DOC
# here 文档会自动在每行结尾增加 \n
here = <<EOF
 这里表示一般的双引号引用，\n haha
   文本文本
EOF
puts here

# 单引号的 here 文档
here = <<'EOF'
  单引号的here文档 \n... 单引号哦 
EOF
puts here

# 带执行符号的 here 文档
here = <<`dir`
ls -l
dir
puts here


### }}}

##
# {{{ 连接字符串
#
puts "aa" "bb" 'cc' "dd"
puts "aa" + "bb" + "cc" + 'dd'
puts "aa" << "bb" << "cc" << "dd"

## 使用 concat 方法，不过不支持链式调用
puts "aa".concat("bb")

## 使用freeze
a = "aa"
a.freeze

begin
    a.concat('dddd') #=>抛出异常 RuntimeError
rescue RuntimeError 
    puts "freeze string" #=> 将会打印
end

puts a.frozen? #=> 注意不是freeze哦


# }}}

##
# {{{ 访问字符串 

line = "A horse! a horse! my kingdom for a horse!"
puts line['horse']
if line['Abc'] == nil 
    puts "e..."
end

# 使用 [n,m] 操作符， n表示索引开始， m 表示获取长度
puts line[0, 10]
puts line[-1, 1]
#使用 [n..m] n表示索引开始, m 表示结束索引 , 包括m的值
puts line[1..10]
#使用 [n...m] 不包括m的值
puts line[1... line.index('my')]
# 使用负数, 注意 n 的位置一定要在m 前面
puts line[-7..-1]
# 使用正则获取对应内容
puts line[/\sk(.)*?\s/] #-> kingdom (带空格)
puts line[/(?<=\s)k(.)*?(?=\s)/] #-> kingdom (不带空格)
# 添加第二个参数， 用来指定查找结果的开始位置
puts line[/horse/, 0]

# }}}

##
# {{{ 比较字符串
# 直接使用 ==
str = "the str"
puts "same string: #{str}" if str == "the str"
puts "same string: #{str}" if str.eql? "the str"

# ruby 中的 <=> 操作符，也叫做船操作符，小于返回 -1， 等于返回0 大于返回 1
puts "a" <=>'A'
puts "a" <=> 97.chr
puts "a" <=> "b"

# 忽略大小写比较 casecmp ，返回值和 <=>一样
puts 'a'.casecmp('A') # => 0

# }}}

## {{{ 操作字符串
# * 重复字符串多次
puts "a Money!" * 3 

# 转换大小写，使用 upcase 和downcase
puts "wangxinyi aaa ".upcase
puts "OK!".downcase + "__"

# 插入一个字符串到另一个字符串中
puts "be carful".insert 6, "e"
# 添加一个词
puts "be carful!".insert 3, "very"
# 配合 *

puts "be carful!".insert 3, "very " * 4
# }}}

## {{{ 改变全部或部分字符串
# 通过[]= 方法，可以修改所有或者部分字符串内容
puts "be carful!"[0..-1]='a'

# []= 方法 和 slice! 一样， 任何使用 []= 都可以使用 slice!替代
line = "A porsche! a Porshche! my kingdom for a Porsche!"
speaker = "king Richard, 2007"

# 给[]= 参数传递一个字符串，如果找到了将会被覆盖为一个新值否则返回nil
speaker[", 2007"] = "III" #=>III
puts speaker

begin
    speaker["2222"] ="III" #=> 会抛出 IndexError 异常
rescue IndexError
    puts speaker
end

speaker[13] = "IV"
puts speaker #=>king RichardIIVI 

# 使用offset 和 length 的方式 两个 fixnum 告诉 []=开始位置，和有多长的字符串想替换掉
line[40, 8] = " Porsche 911 Turbo!" #=> "Porsche 911 Turbo"
puts line 

# 使用正则表达式:
line[/Porsche 911 Turbo!$/] = "Porsche!"

puts line

# }}}

## {{{ chomp 和 chop 方法
# chop(chop!) 去掉字符串最后的字符， chomp(chomp!) 方法， 用来切掉记录分割符号($/) 一般为一个换行符号
mystr = "abcdefgh"
puts mystr.chop #=> abcdefg

noteTest = <<limerick
There a test comme form me
i can said 
limerick

puts noteTest.chomp() + "AAAAA" #=> 在一行上
puts noteTest + "BBBBB"  #=> noteTest 包含换行

# }}}

## {{{ delete 方法
# 使用delete 和 delete! 可以从字符串中删除字符

puts "That's call folks!".delete "c" #=> That's all folks!

# 是所有字符删除， 可以在第二个参数中使用 ^字符， 设置保留字符
puts "That's all folks".delete "abcdefghijklmnopqrstuvwxyz","^all"

# }}} 

## {{{ 子字符串替换  gsub | gsub!
# 使用 gsub 或者 gsub! 使用一个字符串对原字符串进行替换
# 想一下之前的 []= 替换
str =  "str str str"
str["str"] = 'replace'
# 只会替换第一个， 
puts str #=> replace str
# 并且没有找到对应字符会报错
begin
   str["not find"] = "aaaa"
rescue
   puts "not find" # => 没到找会报异常
end

# 使用 gsub进行全部替换
str =  "str str str"
str.gsub!('str','replace')
puts str

# replace 将对字符串本身进行替换 （原对象，不是新对象)
origin_id = str.object_id
str.replace('haha!')
puts str
p origin_id == str.object_id

# }}}

## {{{ 反转字符串
# 使用 reverse 和 reverse! 来反转字符串
palindrome = "denis sinned"
puts palindrome
palindrome.reverse!
puts palindrome

# }}}

## {{{ 转换字符串为 array
# split 方法转换字符串为数组：
# 没有参数调用 split
p "0123456789".split #=> ["0123456789"}
p "0123456789".split(//) #=> 转换成为0-9的数组

# 使用正则 /,/ 分割
p "one, two , three,".split(/,/)

# }}}

### {{{ 转换字符串大小写
# 使用 capitalize 或 capitalize! 转换首字母大小写 其余为小写
puts "my Name iswang".capitalize #=> My name is wang

# upcase downcase
str = "aaaa"
str.upcase!
puts str

# 使用 swapcase 切换大小写
str = "mMnNWnXx"
puts str.swapcase

# }}}

### {{{ 迭代字符串
# 通过 each 方法(1.9 里已经直接使用each_line了)， 或者别名 each_line 方法，迭代字符串每一行
myLine = <<LINE
one line
two line
three line
LINE

myLine.each_line { |line|
   puts 'line is ' + line
}

# 使用each_byte 迭代每一个字节
"haah !".each_byte { |b| print b,"/"}
puts
"中文".each_byte { |b| print b,"/"} #=>一个中文由多个字节构成
puts
# }}}

### {{{ 调整字符串空格
# 调整一个字符串左边或右边空格， 或者把文字居中
title ="Love Lost"
puts title.size

# 使用 ljust, rjuest 进行pad 空格
puts title.ljust(20) + '|'
puts title.rjust(20) + '|'
# 使用其他内容填充
puts title.ljust(20, '-') + '|'
puts title.ljust(20, '->') + '|'
puts title.rjust(20, '-') + '|'

# 使用 center 左右填充
puts title.center(20)

# 使用 lstrip, rstrip 和 strip(和对应!版本)
title =  title.rjust(20)
puts title
title.lstrip!()
puts title

title = title.center(50)
puts title
puts title.strip!()
# }}}

## {{{ 增长字符串
# ruby 允许字符串递增  next 和 next!
puts  "a".next  # => b
puts "az".next #=> "ba"
puts "999.1".next #=> 999.2
# 其他字符通过 ascii 表顺序增长
puts "!".next
puts "a".next.next

# 数字的 next 方法
puts 20.next

# 通过字符串的 upto, downto , 和 block({}) 可以很容易处理增长遍历
"a".upto("x") { |i| print i}
puts
# 使用 for in 处理
for i in "a".."x"
    print i
end
# next 
#}}}

## {{{ 转换字符串
# 转换字符串为浮点 (Float) 或者整形， 使用 to_f 和 to_i
puts
puts "200".to_f.class
puts "100".to_i.class

# 转换字符串到 symbol类
puts "name".intern #=>:name
puts "name".to_sym #=>:name

# 转换对象到字符串
puts (256.0).to_s.class
# }}}

##{{{ ruby 的格式化输出
# 格式化输出是 printf 的简写， 支持和printf 一样的格式
print "this is my %s he said %s , i got money %0.2f$\n" % ['name', 'haha', 123.05]
print "value=%{value}\nname=%{name}" % {:value=>123, :name=>'cost'}
# }}}

## {{{ 简单正则使用
# 使用 =~ 配合正则获取符合条件值的位置， 没有找到返回 nil
puts
p 'my name is abc' =~ /abc/
p 'my name is abc' =~ /wangxinyi/
# }}}

