#!/usr/bin/python
#coding=UTF-8

import os
import time

source = ['/home/luolei/A_Byte_Of_Python', '/home/luolei/tdt.sql']

target_dir = '/tmp/'

target = target_dir + time.strftime('%Y%m%d%H%M%S') + '.zip'

zip_command = "zip -qr %s %s" %(target, ' '.join(source))

if os.system(zip_command) == 0:
	print 'Successful back to', target
else:
	print 'Backup Failed'

