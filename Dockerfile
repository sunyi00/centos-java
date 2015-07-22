FROM centos:7.1.1503



ENV DOWNLOAD_URL http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.tar.gz

RUN yum install -y wget curl tar \
    && mkdir -p /opt/ \
    && cd /opt/ \
    && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" $DOWNLOAD_URL \
    && tar xzf jdk-8u51-linux-x64.tar.gz \
    && cd /opt/jdk1.8.0_51/ \
    && alternatives --install /usr/bin/java java /opt/jdk1.8.0_51/bin/java 1 \
    && alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_51/bin/jar 1 \
    && alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_51/bin/javac 1 \
    && alternatives --set jar /opt/jdk1.8.0_51/bin/jar \
    && alternatives --set javac /opt/jdk1.8.0_51/bin/javac
