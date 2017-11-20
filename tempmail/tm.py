#!/bin/env/python

from tempmail import TempMail
tm = TempMail()
email = 'cd5a8qk536@p33.org'
print tm.get_mailbox(email)
