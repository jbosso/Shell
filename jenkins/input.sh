#!/bin/bash
DB_PASSWORD='root'

env.ABC=bat(returnStdout: true, 
script: '''  @echo off echo abc ''').trim()