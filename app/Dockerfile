FROM rvm:ruby2.2.2

RUN /bin/bash -lc "source /usr/local/rvm/scripts/rvm"

COPY Gemfile* /tmp/
WORKDIR /tmp

RUN /bin/bash -lc "bundle install"

ENV app /app
RUN mkdir $app
WORKDIR $app
ADD . $app

CMD /bin/bash -lc "bundle exec rackup"
