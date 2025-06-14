FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt upgrade -y
RUN apt install python3-pip zstd p7zip-full p7zip-rar -y pipx
RUN pipx install pip
RUN mkdir /app/
WORKDIR /app/
COPY . /app/
RUN pipx install cookiecutter
RUN pipx runpip cookiecutter install -r requirements.txt
CMD bash start.sh
