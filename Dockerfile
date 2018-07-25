FROM openjdk:10

RUN \
  apt install -y apt-transport-https build-essential  ca-certificates curl gnupg2 software-properties-common && \
  curl -sL https://deb.nodesource.com/setup_8.x | bash && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
  echo "deb https://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list && \
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
  apt-get update && \
  apt-get install -y nodejs sbt docker-ce
