#!/usr/bin/env groovy

node {
  def govuk = load("/var/lib/jenkins/groovy_scripts/govuk_jenkinslib.groovy")
  govuk.buildProject([
    overrideTestTask: { echo("There are no tests configured for this application") }
  ])
}
