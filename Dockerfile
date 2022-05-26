FROM apache/skywalking-base:8.6.0-es7

MAINTAINER vbaas@vonechain.com

ENV JAR_HOME /vbaas

ENV TZ=Asia/Shanghai

COPY ./target/fisco-bcos-spring-boot-crud-0.0.1-SNAPSHOT.jar /$JAR_HOME/spring-boot-crud.jar


EXPOSE 45000

WORKDIR $JAR_HOME
#放开禁用的椭圆加密secp256k1
ADD ./java.security /opt/java/openjdk/conf/security/java.security

CMD java ${JVM:=-Xms1g -Xmx1g} -Djava.security.egd=file:/dev/./urandom -jar spring-boot-crud.jar
