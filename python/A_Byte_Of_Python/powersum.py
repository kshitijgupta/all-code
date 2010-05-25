#!/usr/bin/python
#coding=UTF-8

#由于在args变量前有*前缀，所有多余的函数参数都会作为一个元组存储在args中。如果使用的是**前缀，多余的参数则会被认为是一个字典的键/值对。


def powersum(power, *args):
	total = 0
	for i in args:
		total += pow(i, power)
	return total

print powersum(2, 3, 4)

print powersum(2, 10)
