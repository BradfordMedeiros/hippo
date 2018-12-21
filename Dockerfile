FROM ubuntu:18.04
WORKDIR /app
COPY ./build/server /app
RUN ./install.sh
ENTRYPOINT ["./start.sh"]
