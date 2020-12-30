# Emacs On Docker

Docker image for using Emacs on a container.

## How to use

1. edit `init.el`. (default is for my developing environment)
1. build image
   ```bash
   $ docker build --rm -t tesao/development .
   ```
1. run image
   ```
   $ docker run -it tesao/development
   ```

then, you can start emacs on a container!
