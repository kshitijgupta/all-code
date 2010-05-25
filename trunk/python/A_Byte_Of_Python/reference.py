#!/usr/bin/python
#coding=UTF-8

print 'Simple Assignment'
shoplist = ['apple', 'mango', 'carrot', 'banana']
mylist = shoplist#这里是引用

del shoplist[0]

print 'shoplist is', shoplist
print 'mylist is', mylist

print 'Copy by making full slice'
mylist = shoplist[:]#这里是深拷贝

del mylist[0]

print 'shoplist is', shoplist
print 'mylist is', mylist
