FROM docker.fiverr-gw.com:6000/fiverr/ruby:2.2.2

# Configure Environment Variabled
ENV app /app

# Install dependencies
RUN apt-get install -y libgmp-dev

RUN /bin/bash -lc "source /usr/local/rvm/scripts/rvm"

# Cache gems
COPY Gemfile* /tmp/
WORKDIR /tmp

RUN /bin/bash -lc "bundle install"

# Copy app
RUN mkdir $app
WORKDIR $app
ADD . $app
ADD scripts/start.sh $app

