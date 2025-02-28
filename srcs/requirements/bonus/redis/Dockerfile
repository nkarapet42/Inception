FROM debian:bullseye

RUN		apt update && apt install -y redis && rm -rf /var/lib/apt/lists/*

COPY ./tools/redis.sh /tmp/redis.sh

EXPOSE 6379

RUN chmod +x /tmp/redis.sh

CMD ["/tmp/redis.sh"]