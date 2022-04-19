#!/usr/bin/env python3
import os
import pwd

uid = os.getuid()
username = pwd.getpwuid(uid)[0]
print("[*] Found uid ->", uid)
print("[*] Found username ->", username)
print("[*] Generating pacman-nopass.c based on uid and username")
read_fd = open('pacman-nopass.c.template','r')
program = read_fd.read()
program = program.replace('{{name}}', username)
program = program.replace('{{uid}}', str(uid))
write_fd = open('pacman-nopass.c', 'w')
write_fd.write(program)
read_fd.close()
write_fd.close()
print("[*] Done")