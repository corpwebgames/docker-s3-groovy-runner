FROM dpatriot/docker-awscli-java8
MAINTAINER Shago Vyacheslav <v.shago@corpwebgames.com>

#ADD run.sh /opt/
COPY init.sh /opt/

RUN chmod +x /opt/init.sh \
    && curl -s get.gvmtool.net | bash \
    && echo "gvm_auto_answer=true" >> ~/.sdkman/etc/config \
    && /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install groovy" \
    && mkdir -p $HOME/.groovy/lib

RUN /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh && grape install 'com.amazonaws' 'aws-java-sdk' '1.10.40'"

#RUN /bin/bash -c "echo -e 'source /root/.sdkman/bin/sdkman-init.sh' > /etc/profile.d/sdkman-init.sh && chmod +x /etc/profile.d/sdkman-init.sh"

ENV GROOVY_HOME /root/.sdkman/candidates/groovy/current
ENV PATH $GROOVY_HOME/bin:$PATH

#COPY aws-java-sdk-1.10.37.jar $HOME/.groovy/lib/

# Define working directory
WORKDIR /opt

#ENTRYPOINT ["./run.sh"]

CMD [""]
