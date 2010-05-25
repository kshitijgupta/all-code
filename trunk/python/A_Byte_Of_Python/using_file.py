#!/usr/bin/python
#coding=UTF-8

poem = '''\
		Programming is fun
		When the work is done
		if you wanna make your work also fun:
			use Python~
			'''

f = file('poem.txt', 'w')
f.write(poem)
f.close()

f = file('poem.txt')
while True:
	line = f.readline()
	if len(line) == 0:#EOF
		break
	print line,

f.close()
