FROM ubuntu:22.04 AS build

# timezone env with default
ENV TZ=Europe/Copenhagen
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

RUN echo "eula=true" > eula.txt

RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*
    
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/4fb536bfd4a83d61cdbaf684b8d311e66e7d4c49/server.jar

EXPOSE 25565

ENTRYPOINT [ "java" ] 

CMD ["-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui" ]