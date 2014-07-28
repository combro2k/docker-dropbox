#!/bin/bash

chown -R nobody:users /home/

exec /sbin/setuser nobody /opt/dropbox/dropboxd
