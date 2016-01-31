FROM rvm:ruby2.2.2

ENV app /app

RUN apt-get install -y libgmp-dev
RUN /bin/bash -lc "source /usr/local/rvm/scripts/rvm"

COPY Gemfile* /tmp/
WORKDIR /tmp

RUN /bin/bash -lc "bundle install"

RUN mkdir $app
WORKDIR $app
ADD . $app

ONBUILD CMD rvm all do rackup

