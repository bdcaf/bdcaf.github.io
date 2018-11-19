---
Tags: ["unix","config", "offlineimap", "uibk"]
date: 2017-03-30T10:48:59+02:00
lang: en
title: Configuring offlineimap
---

Having most of my workflow on the commandline mailing my results using
Tunderbird or Mail.app is sometimes quite a chore.  I would rather do
it from inside my workflow.  [mutt](http://www.mutt.org/) seems like a
natural option.  I also quite quickly considered alternatives like
[alpine](https://www.washington.edu/alpine/) - though since I prefer
vim for my text editing I quickly decided against it.

## offlineimap
For mutt it quickly became aparent that I would need some external
tool to fetch my mail.  Many sites describe
[offlineimap](http://www.offlineimap.org/) though as the maintainer
put a message that he moved on to
[imapfw](https://github.com/OfflineIMAP/imapfw) I was worried.  Also
my first attempt didn't work out so I quickly decided I wanted to go
with a "maintained" project.

So ultimately I ended at [isync](http://isync.sourceforge.net/).

Initial configurations that I frankensteined together didn't work
either so I had to go on debugging.

### certificate woes

I immediately got certificate errors.  Even for google.  In the
configuration the have a commented line for certificates in the home
directory.  So I decided to get them for myself.  Since I am behind
the universities firewall in the same subnet as the mail servers I was
not to worried that someone might MITM me bad certs.

In short I used
```
[~]$ openssl s_client -connect mailserver.uni.ac.at:993 -showcerts > crt
```
to download them. Basically I replace mailserver.uni.ac.at with my
servers.  Then I used trusty old vim to cut the blocks from
` -----BEGIN CERTIFICATE-----` down to `-----END CERTIFICATE-----`
(including those lines) into individual files which I named based on
the identification before the blocks.

### passwords

Along with this certificate issues I noticed that passwords often are
put in plain text in the config files.  An absolute no-go for me.  I
quickly discovered [pass](https://www.passwordstore.org/) which uses
gpg to encrypt them.

Sure still worried as these are then passed around in plain text - but
at least I will not have them in my repositories on github.

### oh gmail

since most tutorials explicitely explain how to set up gmail I was
confused why it just wouldn't work for me!
It just wouldn't accept the password.  After long and useless research
I recalled something was changed by google.  You can now [create
passwords for less secure
apps](https://support.google.com/accounts/answer/185833) - and that
was it.  All I had to do was create an app password on the linked
site. Nice - so now even in the encrypted store is my google password
and I can easily delete the one for the app.


### final config

so this is what is in my `.mbsyncrc`.  I don't want to post it as big
text block as one needs to fill in the values that fit ones setup.  

##### accounts
```
IMAPAccount uibk
Host exchange.uibk.ac.at
User c....
AuthMechs LOGIN
PassCmd "pass Mail/uibk"
SSLType IMAPS
SSLVersions TLSv1.2
CertificateFile ~/.cert/uibk.crt

IMAPAccount gmail
Host imap.gmail.com
User ....@gmail.com
AuthMechs LOGIN
PassCmd "pass Mail/gmail"
SSLType IMAPS
SSLVersions TLSv1.2
CertificateFile ~/.cert/gmail.crt
```

### stores
nothing fancy here
```
IMAPStore uibk-remote
Account uibk
MaildirStore uibk-local
Path ~/Archive/Mail/Uibk/
Inbox ~/Archive/Mail/Uibk/Inbox

IMAPStore gmail-remote
Account gmail
MaildirStore gmail-local
Path ~/Archive/Mail/Gmail/
Inbox ~/Archive/Mail/Gmail/Inbox
```
though it was essential to create the folders using
`mkdir -p ~/Archive/Mail/Gmail`.


and finally `mbsync uibk gmail` will work without error.


### check automatically
Gotta leave this for now.  I see there is an issue with cron on Mac. 

## Mutt later

Wow this got quite some post. I will describe how to set up mutt next
time.
