@echo this's a file>c:\test.tmp   
rd c:\source\ /s /q
md c:\source
del c:\test.tmp /q
exit