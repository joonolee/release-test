#!/usr/bin/env bash
NEW_VERSION=1.0.0

git pull
sed "s/^version = '.*-SNAPSHOT'$/version = '${NEW_VERSION}-SNAPSHOT'/" build.gradle > build.gradle



