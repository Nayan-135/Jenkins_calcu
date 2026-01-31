FROM jenkins/jenkins:lts

# Switch to root user
USER root

# Install Python & required system packages
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    lsb-release && \
    apt-get clean

# Switch back to Jenkins user
USER jenkins
