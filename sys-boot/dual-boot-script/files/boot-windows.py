#!/usr/bin/env python3
# Modified from https://gist.github.com/Darkhogg/82a651f40f835196df3b1bd1362f5b8c
import subprocess
import sys

# For efivars
# EFIVAR_NAME = 'PreviousBoot'
# EFIVAR_GUID = '36d08fa7-cf0b-42f5-8f14-68df73ed3740'
# EFIVAR_PREFIX = '/sys/firmware/efi/efivars'
# 
# PREFIX = b'\x07\x00\x00\x00'
 SUFFIX = b'\x20\x00\x00\x00'
# 
text = "Microsoft" 
# filename = '{}/{}-{}'.format(EFIVAR_PREFIX, EFIVAR_NAME, EFIVAR_GUID)
# 
# retcode = subprocess.call(['chattr', '-i', filename])
# if retcode != 0:
#     sys.exit(42 + retcode)
# 


filename = '/boot/EFI/refind/vars/PreviousBoot'

with open(filename, 'wb') as f:
    content = bytes(text, 'utf-16-le') + SUFFIX
    f.write(content)
