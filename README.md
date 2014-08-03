docker-dropbox
================

This is a Dockerfile setup for Dropbox - https://www.dropbox.com

To run:

docker run -d --name="dropbox" --privileged=true --net="host" -v /path/to/your/config:/config -v /path/to/your/files:/dropbox -v /etc/localtime:/etc/localtime:ro gfjardim/dropbox