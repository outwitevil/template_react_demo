FROM ruby:2.3-slim
MAINTAINER Adam Lund <adaml007@gmail.com>

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential nodejs libpq-dev

ENV INSTALL_PATH /reactapp

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile* ./

RUN bundle install --binstubs

COPY . .
RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://reactapp:somepassword@127.0.0.1/dbname ACTION_CABLE_ALLOWED_REQUEST_ORIGINS=foo,bar SECRET_TOKEN=dummytoken assets:precompile


CMD puma -C config/puma.rb
