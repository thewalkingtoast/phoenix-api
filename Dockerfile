FROM elixir:latest

MAINTAINER Adam Radabaugh <adam@walkingtoast.com>

ENV PHOENIX_VERSION 1.2.1

# update and install some software requirements
RUN apt-get update && apt-get upgrade -y --fix-missing
RUN apt-get install -y ca-certificates curl wget mysql-client postgresql-client --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHOENIX_VERSION.ez
RUN mix hex.info

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /code
