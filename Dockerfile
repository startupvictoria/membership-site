FROM rails:4.2.6
MAINTAINER jay@startupvictoria.com.au

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock /app/
COPY sample.env /app/.env
COPY . /app

RUN bundle install

EXPOSE 3000

