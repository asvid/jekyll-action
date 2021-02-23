FROM ruby:2.7-alpine

LABEL version="0.0.1"
LABEL repository="https://github.com/asvid/jekyll-action"
LABEL homepage="https://github.com/asvid/jekyll-action"
LABEL maintainer="Adam Świderski <adam.swiderski89@gmail.com>"

ENV PLANTUML_VERSION 1.2020.14
ENV LANG en_US.UTF-8

RUN apk add --no-cache git build-base
# Allow for timezone setting in _config.yml
RUN apk add --update tzdata

# debug
RUN bundle version

COPY LICENSE README.md /

COPY entrypoint.sh /


RUN apk add --no-cache graphviz ttf-droid ttf-droid-nonlatin curl \
    && mkdir /app \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o /app/plantuml.jar \
    && apk del curl

ENTRYPOINT ["/entrypoint.sh"]
