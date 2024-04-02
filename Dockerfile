FROM debian:latest
RUN apt update -y && apt install curl gpg -y
RUN curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
RUN echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | tee /etc/apt/sources.list.d/playit-cloud.list
RUN apt update -y && apt install playit -y
WORKDIR /root
VOLUME ["/root"]
ENTRYPOINT ["playit"]
