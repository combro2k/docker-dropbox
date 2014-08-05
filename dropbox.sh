#!/bin/bash
umask 000

exec /sbin/setuser nobody /opt/dropbox/dropboxd
