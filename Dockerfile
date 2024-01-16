FROM alpine

RUN apk -U --no-cache upgrade
RUN apk -U --no-cache add python3
RUN rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY scripts/start.sh /
COPY wsdd.py /usr/bin/wsdd
RUN chmod +x /start.sh /usr/bin/wsdd

RUN rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

EXPOSE 3702/udp 5357

ENTRYPOINT ["/start.sh"]