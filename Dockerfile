# AlpineLinux with a glibc-2.21 and Oracle Java 8
FROM nirped/docker-base

ENV HADOOP_HOME=/opt/hadoop
ENV HADOOP_PREFIX=/opt/hadoop
ENV PATH=${PATH}:/opt/hadoop/bin

RUN curl -L -o /tmp/hadoop-2.7.2.tar.gz http://apache.spd.co.il/hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz

RUN cd /opt && \
    tar xfz /tmp/hadoop-2.7.2.tar.gz && \
    ln -s ./hadoop-2.7.2 hadoop && \
    rm /tmp/hadoop-2.7.2.tar.gz
    
ADD core-site.toml /etc/confd/conf.d/
ADD hdfs-site.toml /etc/confd/conf.d/
ADD hadoop-env.toml /etc/confd/conf.d/
ADD core-site.xml.tmpl /etc/confd/templates/
ADD hdfs-site.xml.tmpl /etc/confd/templates/
ADD hadoop-env.sh.tmpl /etc/confd/templates/

ADD bootstrap.sh /tmp/
RUN chmod 0744 /tmp/bootstrap.sh

RUN touch /tmp/.EMPTY

CMD /tmp/bootstrap.sh



