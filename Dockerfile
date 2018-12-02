FROM ruby:2.4.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs \
    postgresql-client \
    mysql-client \
    imagemagick \
    tzdata 
RUN rm -rf /var/lib/apt/lists/*
ARG APP_ROOT=/app   
WORKDIR ${APP_ROOT}
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./
EXPOSE 4000
ENTRYPOINT ["./bin/start.sh"]