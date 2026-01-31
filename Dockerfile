FROM jenkins/jenkins:lts

# Switch to root to install system dependencies
USER root

RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    lsb-release && \
    apt-get clean

# Make python and pip accessible as python/pip
RUN ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

# Switch back to Jenkins user
USER jenkins
