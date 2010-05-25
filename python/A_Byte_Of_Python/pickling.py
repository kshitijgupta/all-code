#!/usr/bin/python
#coding=UTF-8

import cPickle as p

shoplistfile = 'shoplist.data'

shoplist = ['apple', 'mango', 'carrot']

f = file(shoplistfile, 'w')
p.dump(shoplist, f)
f.close()

del shoplist

f = file(shoplistfile)

soredlist = p.load(f)

print soredlist
