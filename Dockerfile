FROM openjdk:8-jre-alpine

LABEL maintainer="jforge <github@forge.de>"

ENV KAFKA_VERSION="3.6.0"
ENV SCALA_VERSION="2.13"

RUN apk --update add ca-certificates wget bash && \
    rm -rf /var/cache/apk && \
	wget -q https://dlcdn.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -O /tmp/kafka.tgz && \
	mkdir -p /opt && tar -xzf /tmp/kafka.tgz -C /opt && \
	mv /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka && \
	rm -rf /opt/kafka/site-docs && \
    rm -rf /opt/kafka/bin/windows && \
    rm -f /opt/kafka/libs/rocksdbjni-* && \
    rm -rf /usr/share/X11 && \
    rm -rf /usr/share/alsa && \
    rm /tmp/kafka.tgz

ENV PATH="/opt/kafka/bin:${PATH}"
