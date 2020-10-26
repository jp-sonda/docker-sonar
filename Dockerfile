FROM sonarqube:7.9.4-community

LABEL maintainer="joao.parana@gmail.com"

# Using openjdk:11-jre-slim
USER root

RUN apt-get update \
    && apt-get install -y \
    procps lsof socat git htop sudo net-tools locales

USER sonarqube    
ENTRYPOINT ["./bin/run.sh"]
