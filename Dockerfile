FROM openjdk:10

RUN \
  curl -sL https://deb.nodesource.com/setup_8.x | bash && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
  echo "deb https://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list && \
  apt-get update && \
  apt-get install -y nodejs build-essential sbt docker.io
