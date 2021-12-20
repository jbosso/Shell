#!/bin/bash
DB_PASSWORD='root'

env.DB_PASSWORD=bat(returnStdout: true, 
script: '''  @echo off echo '$DB_PASSWORD' ''').trim()