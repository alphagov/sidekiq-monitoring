> This repo was archived in October 2023 as `sidekiq-monitoring` has been deprecated as part of GOV.UK's replatforming to EKS.

# Sidekiq monitoring

Sidekiq monitoring is a web application that uses [Sidekiq’s][sidekiq] [monitoring tool](https://github.com/mperham/sidekiq/wiki/Monitoring#standalone) to monitor multiple [Sidekiq] configurations used throughout [GOV.UK][govuk].

Sidekiq holds its Redis configuration globally so we have to run a separate Rack server for each application. These are defined in the [Procfile](Procfile).

## Prerequisites

* [Git]
* [Ruby]
* [Bundler]
* [Redis]

## Installation

Clone the repository:

```sh
$ git clone git@github.com:alphagov/sidekiq-monitoring.git
```

Setup the application:

```sh
$ ./bin/setup
```

## Configuration

The application takes its Redis configuration from the environment. It expects keys to be prefixed with the identifier of the application to be monitored. A 'dummy' application would require `DUMMY_REDIS_HOST` and `DUMMY_REDIS_PORT`.

## Usage

To monitor a specific application:

```sh
$ ./bin/foreman run publisher
```

To monitor all applications:

```sh
$ ./bin/foreman start
```

[Bundler]: http://bundler.io
[Git]: http://git-scm.com
[GOVUK]: https://www.gov.uk
[Redis]: http://redis.io
[Ruby]: https://www.ruby-lang.org
[Sidekiq]: http://sidekiq.org

## Licence

[MIT License](LICENCE)
