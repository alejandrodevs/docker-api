FROM ruby:2.5.0

ENV APP_HOME /docker_app
WORKDIR $APP_HOME

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  redis-server \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY Gemfile Gemfile.lock $APP_HOME/
RUN bundle install
COPY . $APP_HOME
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
