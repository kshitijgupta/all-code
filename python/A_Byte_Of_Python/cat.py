#!/usr/bin/python
#coding=UTF-8

import sys

def readfile(filename):
	f = file(filename)
	while True:
		line = f.readline()
		if len(line) == 0:
			break
		print line,#notice comma
	f.close()


if len(sys.argv) < 2:
	print 'No action specified'
	sys.exit()

if sys.argv[1].startswith('--'):
	option = sys.argv[1][2:]
	if option == 'version':
		print 'Version 0.1'
	elif option == 'help':
		print '''\
				This program prints files to the \
				standard output. Any number of files\
				can be specified.\
				Options include:\
				  --version : Prints the version number\
				  --help : Display this help
				  '''
	else:
		print 'Unkown option'
	sys.exit()

else:
	for filename in sys.argv[1:]:
		readfile(filename)
