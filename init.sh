#!/usr/bin/env groovy
@Grapes([
  @Grab(group='com.amazonaws', module='aws-java-sdk', version='1.10.40')
])
import com.amazonaws.*

println "loading aws sdk..."