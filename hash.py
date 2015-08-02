import os
import sys
import hashlib
import getpass
import crypt

# crypt cannot generate correct result under OSX,
# so we need to ensure this is running under linux
if sys.platform != 'linux2':
    print 'Can only be ran under Linux'
    sys.exit(-1)

salt = hashlib.sha1(os.urandom(64)).hexdigest()
insalt = '$6${}$'.format(salt)
password = getpass.getpass('Password: ')
repeat = getpass.getpass('Repeat: ')
if password != repeat:
    print 'Password does not match'
    sys.exit(-1)
hashed = crypt.crypt(password, insalt)
print hashed
