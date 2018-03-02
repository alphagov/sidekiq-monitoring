#!/usr/bin/env groovy

library("govuk")

node {
  govuk.buildProject([
    overrideTestTask: { echo("There are no tests configured for this application") }
  ])
}
