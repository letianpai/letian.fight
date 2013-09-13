#!/usr/bin/ruby
# coding:utf-8

##
# ruby ������� sample
# 
## 
#��������
##

# ����һ��������
months = Array.new 
months2 = []

p months
p months2
p months.empty?

# ��������ʱ�����Գ�ʼ������Ĵ�С
# ���ַ�ʽ����һ������12 �����飬 ��ʼ��ֵΪ nil
months = Array.new(12)
p months
p months.size
# �൱�� p months
puts months.inspect

# ʹ�� new ʱ����ʹ�õڶ�����������ʼ��Ԫ�ص�ֵ
month = Array.new(12, "month")
p month

##
# �������
## 
## ʹ��clear �����������, ������clear�����������
months.clear # => []
p months.empty? # => true

## ʹ�� block ����һ�� Array
rum = Array.new(10) { |e| e = e *2}
p rum

## ʹ��Array �� []���� ��������
month_abbrv = Array.[]( "jan", "feb", "mar", "apr" , "may", "jun", "jul", "aug", "sep", "oct", "nov" ,"dec") 
p month_abbrv

## ͬ���� ֱ��д�� [] ��:
month_abbrv = Array["jan", "feb", "mar", "apr" , "may", "jun", "jul", "aug", "sep", "oct", "nov" ,"dec"]
p month_abbrv

## ����ͨ����Χ���� ".." ֱ�ӽ���һ����Χ����
digits = Array(0..9)
p digits

## ʹ�� %w ��quote �������ֵ�� ������ֵ��Ϊ�ַ�������
months =  %w[ nil January February March Aprll May June August July August]
p months #=>["nil", "January", "February", "March", "Aprll", "May", "June", "August", "July", "August"]

#ʹ�� each ����������
months.each {|e| print e.class, " "}


##
#  ��������
#
##
q1 = %w[ January February March]
puts
p q1

# ����ʹ��[] ��������������Ԫ�أ� 
p q1[0] #=> January
p q1[2] #=>March

# Ҳ����ʹ��at ����
p q1.at(0) #=>January

# �����������һ��Ԫ��
# ͨ���������ԴӺ�ʼ����Ԫ�أ� �Դ�����
p q1[-1]  # => March
p q1[-2]

# ���һ������ĵ�һ�������һ��
p q1.first
# ���Ը���һ�����β����� ��ʾ�������������
p q1.last 0

# ʹ�� index ��ȡһ��Ԫ�ص�����λ�ã����û���ҵ�������nil
p q1.index "March" # => 2

# ʹ�� rindex ,�򷵻������ϵ�Ԫ��
q1 = %w[ March January February March ]
p q1.rindex "March" #=> 3

## ��ȡ���鷶Χ

year = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009]

# ָ��Ԫ�ؿ�ʼλ�úͻ�ȡ����
p year[0, 3] #= > [2000, 2001, 2002]

# ʹ�÷�Χ������
p year[7..9] #=>[2007, 2008, 2009]
p year[7...9]

# ����ʹ��slice ��� []
p year.slice(1)
p year.slice(0, 4)
p year.slice(0..2)

## ����ж�һ�������Ƿ����һ��Ԫ�أ� ʹ�� include?
p year.include? 2004  #=> true
p year.include? 2010  #=> false

####
# �ϲ�����
####
# ʹ�� + ��������������
q1 = Array.new(5) {|x| x = x+1 }
q2 = Array(6..9)  
q3 = q1 + q2
p q3

# ����ʹ�� << �������Ԫ��, ���� push
q3 << 11 << 12 << 13
p q3

# ����ʹ��concat �������ϲ�����(�൱�� +)
last_part = q3.concat(q2)
p last_part

####
# ���鼯�ϲ���
#
####
# ruby �������ṩ��һЩ���Ϸ���
# ����ʹ�� & �ʹ�� -  ����ʹ�� |
# ��������һ�������飬 �ϲ����������Ԫ�أ� ��ɾ������Ԫ�صĲ��ظ�Ԫ��
tue = [ "shop", "make pie", "sleep" ]
wed = [ "shop", "make pie", "read", "sleep"]
p tue & wed

# �����һ�������飬 ɾ���ڶ���Ԫ���д��ڵ�����
p wed - tue # => ["read"]

# ����(|) �ϲ��������飬 ��ɾ���ظ�ֵ(+) ����ɾ���ظ�ֵ
p wed | tue

# ���Ҫ��������ļ��϶��� ����ʹ�� Ruby ��Set ��

####
#  ʹ�� uniq ������������ȥ��
####
# uniq ������ɾ��һ����������ظ�Ԫ�أ� ����һ�������飬 ͬ�� uniq! ���޸�ԭ����
shopping_list = %w[ cheese break crackers potatoes carrots cheese ]
p shopping_list.uniq

####
# ������Ϊջʹ��
####
# ʹ������ģ���ջʹ��, ʹ�ú����ȳ� (LIFO) �� ʹ������� push �� pop����
fruit = %w[ apple crange banana ]
p fruit.pop # =>  "banana"
p fruit
fruit.push "mango"
p fruit  # => ["apple", "orange", "mango" ]

####
# �Ƚ�����
####
## �������������������Ƚ������Ƿ���ȣ� ==�� ��==�� �� eql?
bob = ["full", 40, "yes"]
lou = ["part", 23, "no"]
schlomo = ["full", 40, "yes"]

# ʹ�� == �Ƚ����������Ƿ����:
# ������ȱ�ʾ: 1. �����������ͬ��������Ԫ�أ� 2. ÿ�������Ԫ�����ݱ�����ȣ�˳��Ҳ�����)
p lou == lou #=> true
p bob == schlomo #=> true
p schlomo == lou #=> false

# eql? �� === ��ͬ�� eql? ��ֹ���ֵ�Ƿ���ȣ������ֵ������
# ʹ�� <=> ̫�մ��ȽϷ����бȽ�
p lou <=> lou # => 0
p bob <=> lou #=> -1
p lou <=> schlomo #=> 1

####
#  �޸�����Ԫ��
####
months = %w[ nil January February March April May June July August September October November December ]
p months 

# ͨ�� insert ��ָ��λ�ò���Ԫ��
months =  months.slice(1..-1)
months.insert(0, nil)
p months

# ͨ�� slice , [n...m] �޸�������һ����Χ��Ԫ��
months[5..7] = "Mai", "Jun1", "Juli" 
p months

# Ҳ����ʹ�� [start, len] �ķ�ʽ�滻
months[5, 3] = "--May", "June", "July"
p months

####
#  ת������Ϊ�ַ���
####
## ʹ��join ������ ����������Ԫ����ϳ�һ���ַ���
greeting = ["Hello! ", "Bonjour! ", "Guten Tag!" ]
puts greeting.join 

#ʹ�� join �ڶ���������������ϵķָ����
months = %w[ January February March April May June July August September October November December ]
p months.join ", "

# ����ʹ�� compact ȥ��������ֵΪ nil ��Ԫ��
hasNil = [nil , "test1", nil, "test2"]
p hasNil.compact

####
# ʹ�� shift ��unshift 
####
# ʹ��shift ��������ز���ȡ���ݣ���pop �෴), �������Ϊ�գ�����nil, ʹ��unshift �ڵز���������
datas = [4,5,6,7]
p datas.shift #=> 4
p datas #= [5,6,8]
datas.clear
p datas.shift # => nil

####
#  ʹ��each + block ����һ������
#  ʹ�� map ����� block ����һ��������
####
months = months.each {|v|  v= 'xxx'}
p months  # => û�б仯 
months2 = months.map {|v| v = 'xxx'}
p months2  # => ���������'xxx'

## ʹ�� each_index ���� key
months.each_index {|i| puts 'key:' + i.to_s + ' value:' + months[i] } 


####
#  ���������
####
x = [2, 4, 1, 7 , 23, 99, 14, 27]
# ����ʹ�� select ����filter
p x.select { |v| v % 2 == 0 }
# ʹ��sort ���� sort! ������k
p x.sort! # => [1 , 2 , 4, 7, 14, 23, 27, 99]
# ����Ҫ��Ԫ�ر����ܹ��ɱȽ�.

# ʹ��reverse ���� reverse������ת�����˳��
x.reverse!
p x

####
# ��ά����
####
# ��ά���������������飬ֱ�Ӷ����ά����
d2 = [ ["january", 2007],
       ["February", 2007],
       ["March", 2007], ]
p d2

# ʹ�� flatten, flatten! ƽ�л�Ϊһά����
p d2.flatten #=>  ["january", 2007, "February", 2007, "March", 2007]
# flatten  ���Ը�һ�����β�����ʾƽ�л�����
d2.push ['1', ['2']]
p d2.flatten 1 #=> ["january", 2007, "February", 2007, "March", 2007, "1", ["2"]]

# ���԰Ѷ�ά������Ϊһ�� �������ݣ� Ȼ�����ʹ�� transpose ����������ת��

d2 = [ ["January", 2007], ["February", 2007], ["March", 2007] ]
p d2.transpose #=> ["January", "February", "March"], [2007, 2007, 2007]]

