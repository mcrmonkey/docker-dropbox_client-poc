# docker-dropbox_client-poc

Dropbox in container with LD_PRELOAD patch from https://github.com/dark/dropbox-filesystem-fix

Dropbox only supports specific filesystems on linux ( ext4, btrfs ) this
LD_PRELOAD tricks the client when it tries to detect the FS


## Running

**NOTE**: This is a proof of concept thing. If you run this you do so *at your
own risk*. Its **not** supported by DropBox and your data may be
damaged or lost as a result.


```console

docker run -it --rm --name db-poc -v /data/dot-dropbox:/root/.dropbox -v
/data/dropbox:/root/Dropbox <imagename>

```

You'll need to run this twice, first for setup and then again to start sync
ctrl-c when you see message about unsupported filesystem then run it again.




