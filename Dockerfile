FROM debian:buster as builder

RUN apt-get update -qq && apt-get install -qq build-essential git curl wget

RUN git clone https://github.com/dark/dropbox-filesystem-fix

RUN cd dropbox-filesystem-fix && make


FROM debian:buster

RUN apt-get update -qq && apt-get install -qq libglib2.0 libglapi-mesa libxext6 \
libxdamage1 libxcb-glx0 libxcb-dri2-0 libxcb-dri3-0 libxcb-present0 \
libxcb-sync1 libxshmfence1 libxxf86vm1 wget tar

COPY --from=builder /dropbox-filesystem-fix/libdropbox_fs_fix.so /

RUN cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

ADD entrypoint.sh /


ENTRYPOINT ["/entrypoint.sh"]
