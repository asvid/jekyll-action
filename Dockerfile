FROM ruby:2.7-alpine

LABEL version="0.0.1"
LABEL repository="https://github.com/asvid/jekyll-action"
LABEL homepage="https://github.com/asvid/jekyll-action"
LABEL maintainer="Adam Świderski <adam.swiderski89@gmail.com>"

RUN apk add --no-cache plantuml
COPY plantuml.jar /usr/share/plantuml/plantuml.jar

RUN apk add --no-cache git build-base
# Allow for timezone setting in _config.yml
RUN apk add --update tzdata

# debug
RUN bundle version

COPY LICENSE README.md /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
