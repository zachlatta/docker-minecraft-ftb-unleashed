FROM zachlatta/jvm
MAINTAINER Zach Latta <zach@zachlatta.com>

RUN useradd -s /bin/bash -d /minecraft -m minecraft
ADD http://www.creeperrepo.net/direct/FTB2/3f82143e7ddfbc55a3e5906940d2effd/modpacks%5EUnleashed%5E1_1_3%5EUnleashed-server.zip /minecraft/unleashed.zip

RUN apt-get install zip -y
RUN cd /minecraft && unzip unleashed.zip && rm unleashed.zip
RUN chown -R minecraft:minecraft /minecraft

VOLUME /minecraft
WORKDIR /minecraft
USER minecraft
EXPOSE 25565

ENTRYPOINT java -Xms512M -Xmx1G -XX:PermSize=128m -jar ftbserver.jar
