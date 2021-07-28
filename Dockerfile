FROM adoptopenjdk/openjdk11:slim

RUN \
  curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
  echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list && \
  echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list && \
  curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add && \
  apt-get update && \
  apt-get install -y nodejs build-essential sbt docker.io gcc g++ make yarn wget python-pip && \
  npm install -g yarn && \
  pip install --upgrade pip docker-compose && \
  echo '#!/usr/bin/env sh' > /usr/local/bin/amm && \
  curl -s https://api.github.com/repos/lihaoyi/ammonite/releases/latest \
    | grep browser_download_url \
    | grep -v bootstrap \
    | sort -V \
    | tail -n1 \
    | cut -d '"' -f 4 \
    | wget -i - -O /usr/local/bin/amm && \
  chmod +x /usr/local/bin/amm
