FROM ruby:2.3.3-slim

RUN apt-get update -qq && apt-get install -y sudo libgmp3-dev libssl-dev build-essential libpq-dev postgresql-client

ENV RAILS_ROOT /var/www/discoursehub

RUN mkdir -p $RAILS_ROOT/tmp/pids

WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile

COPY Gemfile.lock Gemfile.lock

RUN gem install bundler

RUN echo 'gem: --no-document' >> /usr/local/etc/gemrc

COPY . .

RUN bundle install --without development test

CMD bundle exec puma -C config/puma.rb -e production
