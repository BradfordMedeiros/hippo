FROM ubuntu:18.04
WORKDIR /app
COPY ./build/server /app
RUN ./install.sh
CMD ./start.sh
