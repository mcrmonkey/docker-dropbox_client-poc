#!/bin/sh

if [[ -d ~/.dropbox/instance1 ]]
then
	LD_PRELOAD=/libdropbox_fs_fix.so ~/.dropbox-dist/dropboxd
else
	echo "Setup mode"
	~/.dropbox-dist/dropboxd
fi
