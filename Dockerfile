FROM debian:buster-slim
LABEL maintainer="javidot"

# Expose Ports
EXPOSE 22005/udp
EXPOSE 22006

# ------------#
#    Setup    #
# ------------#

# Update and install packages
RUN apt update && apt install -y \
    wget \
    gcc \
    git

# Update and install .NET packages
RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt update && apt install -y \
    apt-transport-https \
    dotnet-sdk-5.0 -y && \
    rm packages-microsoft-prod.deb && \
    rm -rf /var/lib/apt/lists/*

# Download ragemp server
RUN wget -O /tmp/prerelease.tar.gz https://cdn.rage.mp/updater/prerelease/server-files/linux_x64.tar.gz && \
    tar -xzf /tmp/prerelease.tar.gz -C /tmp && \
    rm /tmp/prerelease.tar.gz && \
    mkdir -p /tmpfiles && \
    mv /tmp/ragemp-srv/* /tmpfiles/ && \
    chmod +x /tmpfiles/ragemp-server && \
    rm -rf /tmp/ragemp-srv/ && \
    mkdir -p /ragempsrv


# Add setting files
ADD entrypoint.sh /home/entrypoint.sh
ADD conf.json /tmpfiles/conf.json
ADD meta.xml /tmpfiles/meta.xml

VOLUME /ragempsrv

ENTRYPOINT ["sh", "/home/entrypoint.sh"]
