FROM amazonlinux:2

ARG PYTHON_VERSION

RUN yum update -y && \
    yum -y install gcc zip unzip make git jq tar openssl11 openssl11-devel bzip2-devel libffi-devel awscli && \
    yum -y clean all && \
    cd /tmp &&  \
        curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz --output Python-$PYTHON_VERSION.tgz && \
        tar xzf Python-$PYTHON_VERSION.tgz && \
        Python-$PYTHON_VERSION/configure --enable-optimizations &&  \
        make altinstall &&  \
        PYTHON_MINOR_VERSION=$(echo $PYTHON_VERSION | cut -d. -f1,2) && \
    cd / && \
    rm -rf /tmp/*
