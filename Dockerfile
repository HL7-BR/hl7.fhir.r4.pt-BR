FROM ruby:3.1.3

WORKDIR /app

RUN apt-get update && \
    apt-get install -y openjdk-11-jdk

RUN gem install jekyll

RUN mkdir -p /root/.fhir/packages

COPY . /app

RUN ./_updatePublisher.sh -y

CMD ["/bin/bash", "-c", "./_genonce.sh"]