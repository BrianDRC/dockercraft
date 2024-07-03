FROM ubuntu:20.04

WORKDIR /minecraft

RUN apt-get update && apt-get install -y \
    wget \
    openjdk-21-jre-headless \
    screen \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O minecraft_server.jar https://piston-data.mojang.com/v1/objects/450698d1863ab5180c25d7c804ef0fe6369dd1ba/server.jar

RUN wget -O forge-installer.jar https://maven.minecraftforge.net/net/minecraftforge/forge/1.21-51.0.21/forge-1.21-51.0.21-installer.jar \
    && java -jar forge-installer.jar --installServer \
    && rm forge-installer.jar

RUN echo "eula=true" > eula.txt

RUN echo "online-mode=false" >> server.properties

COPY mc_command.sh /usr/local/bin/mc_command.sh
RUN chmod +x /usr/local/bin/mc_command.sh

EXPOSE 25565

CMD ["sh", "-c", "screen -S minecraft -dm bash -c 'java -Xmx1024M -Xms1024M -jar forge-1.21-51.0.21.jar nogui' && tail -f /dev/null"]