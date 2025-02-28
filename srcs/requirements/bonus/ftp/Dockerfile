FROM debian:bullseye

RUN	apt update -y && apt upgrade -y

RUN apt install vsftpd -y &&  apt install ftp -y

EXPOSE 21

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/run-ftp.sh /tmp/run-ftp.sh

RUN chmod +x /tmp/run-ftp.sh

CMD ["/tmp/run-ftp.sh"]

