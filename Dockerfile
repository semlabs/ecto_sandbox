FROM elixir:1.6.4

ENV DEBIAN_FRONTEND=noninteractive

ARG ENV=prod

ENV MIX_ENV=$ENV REPLACE_OS_VARS=true

ADD . /app/

WORKDIR /app

RUN mix do \
      local.hex --force, \
      local.rebar --force

RUN mix do \
      deps.clean --all, \
      deps.get, \
      compile

EXPOSE 4001

CMD mix do ecto.create, ecto.migrate, phx.server
