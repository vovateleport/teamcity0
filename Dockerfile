FROM vt25/centos7-jre-8u77

VOLUME ["/var/lib/teamcity"]

ENV TEAMCITY_VERSION 9.1.6
ENV TEAMCITY_SERVER_MEM_OPTS -Xmx750m -XX:MaxPermSize270m
ENV TEAMCITY_DATA_PATH /var/lib/teamcity

RUN wget http://download.jetbrains.com/teamcity/TeamCity-$TEAMCITY_VERSION.tar.gz 
RUN echo "cc95d840798d948b764f0a65962648644d086c7426d5271c32d7b309c8905f9d	*TeamCity-$TEAMCITY_VERSION.tar.gz" >> SHA256SUM 
RUN sha256sum -c SHA256SUM 
RUN rm -f SHA256SUM 
RUN tar -xvzf TeamCity-$TEAMCITY_VERSION.tar.gz 
RUN rm -f TeamCity-$TEAMCITY_VERSION.tar.gz 

EXPOSE 8111
