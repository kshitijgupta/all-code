#!/usr/bin/python
#coding=UTF-8

class Person:
	def __init__(self, name):
		self.name = name
	def sayHi(self):
		print 'Hello, my name is', self.name

p = Person('Luo Lei')
p.sayHi()
