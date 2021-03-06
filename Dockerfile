FROM ruby:2.6.3
ENV LANG C.UTF-8
RUN apt-get update -qq &&\
    apt-get install -y curl zip &&\
    apt-get update -qq &&\
    apt-get install -y --no-install-recommends \
            build-essential libpq-dev libfontconfig1 libpq-dev postgresql-client imagemagick &&\
    rm -rf /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash
RUN apt-get install -qq -y nodejs
RUN npm install -g yarn

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

COPY package.json /myapp/package.json
COPY yarn.lock /myapp/yarn.lock

RUN yarn install -f
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
#EXPOSE 3000

# Start the main process.
#CMD ["rails", "server", "-b", "0.0.0.0"]
