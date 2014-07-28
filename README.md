# Sidekiq monitoring

This repository contains sidekiq monitoring web applications configured as [standalone](https://github.com/mperham/sidekiq/wiki/Monitoring#standalone) apps.

Each directory contains a rack configuration and a redis configuration. `rackup` will read the `config.ru` and bring up the sidekiq monitoring web interface. Sidekiq uses redis to persist queue information, hence the `redis.yml` will provide it information about the redis instance to use.

## Getting started

In order to run these apps use the processes configured in the Procfile:

```sh
  $ bundle
  $ bundle exec foreman start
```
