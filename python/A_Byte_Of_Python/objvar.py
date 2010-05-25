#!/usr/bin/python
#coding=UTF-8

class Person:
	'''Represents a person.'''
	population = 0

	def __init__(self, name):
		'''Initializes the person's data.'''
		self.name = name
		print '(Initializing %s)' % self.name

		Person.population += 1

	def __del__(self):
		'''I am dying'''
		print '%s syas bye.' % self.name

		Person.population -= 1

		if Person.population == 0:
			print 'I am the last one.'
		else:
			print 'There are still %d people left.' % \
					Person.population
	def sayHi(self):
		'''Greeting by the person.
		Really, that's all it does'''
		print 'Hi, my name is %s.' % self.name

	def howMany(self):
		'''Prints the current population'''
		if Person.population == 1:
			print "I am the only person here"
		else:
			print 'We have %d persons here.' % Person.population


_luolei = Person('luolei')
_luolei.sayHi()
_luolei.howMany()

xiaoming = Person('Xiao Ming')
xiaoming.sayHi()
xiaoming.howMany()

_luolei.sayHi()
_luolei.howMany()
