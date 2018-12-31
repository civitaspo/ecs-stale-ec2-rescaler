FROM amazonlinux:2

RUN yum update -y                \
      && yum install -y aws-cli  \
                        jq       \
      && rm -rf /var/cache/yum/* \
      && yum clean all

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

