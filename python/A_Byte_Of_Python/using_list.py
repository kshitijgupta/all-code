#!/usr/bin/python
#coding=UTF-8


shoplist = ['apple', 'mango', 'carrot', 'banana']

print 'I have', len(shoplist), 'items to purchase.'

for item in shoplist:
	print item,#注意，我们在print语句的结尾使用了一个 逗号 来消除每个print语句自动打印的换行符。这样做有点难看，不过确实简单有效。

print '\nI also have to buy rice.'

shoplist.append('rice')

print 'I will sort my list now'

shoplist.sort()

print 'Sorted shopping list is', shoplist

print 'The first item I will buy is', shoplist[0]
olditem = shoplist[0]
del shoplist[0]
print 'I bought the', olditem
print 'My shopping list is now', shoplist
