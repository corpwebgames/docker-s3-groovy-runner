FROM dpatriot/docker-awscli-java8
MAINTAINER Shago Vyacheslav <v.shago@corpwebgames.com>

ADD run.sh /opt/
RUN chmod +x /opt/run.sh \
    && curl -s get.gvmtool.net | bash \
    && echo "gvm_auto_answer=true" >> ~/.sdkman/etc/config \
    && /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install groovy" \
    && mkdir -p $HOME/.groovy/lib

COPY aws-java-sdk-1.10.37.jar $HOME/.groovy/lib/

# Define working directory
WORKDIR /opt

ENTRYPOINT ["./run.sh"]

CMD [""]
