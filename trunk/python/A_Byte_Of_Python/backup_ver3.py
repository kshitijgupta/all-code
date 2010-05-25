#!/usr/bin/python
#coding=UTF-8

import os
import time

source = ['/home/luolei/A_Byte_Of_Python', '/home/luolei/tdt.sql']

target_dir = '/tmp/backup/'

today = target_dir + time.strftime('%Y%m%d') 

now = time.strftime('%H%M%S')

comment = raw_input('Enter a comment -->')

if len(comment) == 0:
	target = today + os.sep + now + '_' + '.zip'
else:
	target = today + os.sep + now + '_' + comment.replace(' ', '_') + '.zip'

if not os.path.exists(today):
	os.mkdir(today)
	print 'Successfully created directory', today

zip_command = "zip -qr %s %s" %(target, ' '.join(source))

if os.system(zip_command) == 0:
	print 'Successful back to', target
else:
	print 'Backup Failed'

