FROM ruby:2.5.0

ENV APP_HOME /docker_app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apt-get update -qq
RUN apt-get install -y build-essential
RUN apt-get install -y libpq-dev
RUN apt-get install -y nodejs
RUN apt-get install -y redis-server

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock
RUN bundle install
COPY . $APP_HOME
