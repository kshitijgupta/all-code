@echo this's a file>c:\test.tmp   
rd c:\backup\ /s /q
md c:\backup
del c:\test.tmp /q
exit