---
title: "Configuring Syncthing on Mac Server"
date: 2019-02-05T10:58:41+01:00
tags:
  - syncthing
  - mac
categories:
  - dev
---

[Syncthing](https://syncthing.net) is currently my preferred tool to
keep folders in sync.  Previously I had affairs with [git
annex](https://git-annex.branchable.com), and
[rsync](https://rsync.samba.org) scripts.

Recently I reactivated a 2009 Mac Mini as headless server under El
Capitan.  [Homebrew](https://brew.sh) is the tool of choice - it
complains a little about the old OS but things work out nicely.  



<!--more-->
## hard drives not being mounted

However the first issue was that the drives would not be mounted
without a user logging in.  I was able to find following
[snippet](https://gist.github.com/jabenninghoff/f13f81c286e914c48942f973f5d15819):

    sudo defaults write /Library/Preferences/SystemConfiguration/autodiskmount AutomountDisksWithoutUserLogin -bool true

## syncthing not starting

Homebrew documents how the get syncthing started for a user.  However
again this would mean someone would need to login before things get
going.   I was able to resolve this by moving the installed plist from
`~/Library/LaunchAgents/` to `/Library/LaunchDaemons/` and adding the
entry:

      <key>UserName</key>
      <string>myuser</string>

So it would finally launch.

## syncthing launching before harddrive

However it turned out it would launch syncthing *before* the external
drive was ready so syncthing would spew errors and not sync without
interaction.

I was not able to solve this within the plist so I created a quick
shellscript that would sleep until the drive was ready:

    #!/bin/sh
    SYNCDRIVE='/Volumes/Media/'
    while [ ! -d "$SYNCDRIVE" ]; do
	sleep 10
    done
    /usr/local/opt/syncthing/bin/syncthing -no-browser -no-restart

## firewall

After all this it was still not syncing.  Being on a headless machine
I haven't gotten the firewall warning.  So the final step was easy to
allow `syncthing` getting connections.

## ssh

Last thing was getting things to work was to get to sync through an
ssh tunnel.  There is a [good
description](https://docs.syncthing.net/users/tunneling.html) however
I made the mistake to skim the last port number.  Turns out in the
last command they leave one digit away so search all the ports.  Once
fixing to `22000` all syncing starts/


### on my current decisions

With annex I continuously had problems that my repos wouldn't merge
nicely.  Also although it is under active development the
documentation is difficult to read - many examples on the site are 5
years or older, which makes it difficult to realise which apply to the
current version.  I just never managed to get it sync automatically.
Rsync always had to be run to check for changes.  Since it has to
rescan the remote files it always takes some extra toll.  This is
great for some tasks.  But for my application where I control all
endpoints it was unnecessary.

My machine wouldn't run the latest Mac OS so I had to choose El Capitan. 
Instead of Mac OS I also experimented with Ubuntu linux.
Linux would offer me all the latest versions and installed nicely.
Unfortunately I quickly ran into troubles - updating was not as smooth
as I am used to.  Every other time I had to tweak GRUB as the machine
would not boot.  Also I noticed I was not able to use all of the
hardware.   The most problematic was power management as I didn't want
the machine to burn its cupboard.  But I also was unable to get the
graphics card and more than one CPU core working.  Searching the
internet led me to believe this is a common trouble.  But maybe in a
few years when El Capitan no longer gets security patches I will
change.
