#!/bin/bash

VERSION=$1
TAG="v${VERSION}"
if [ $VERSION == 'early-access' ]; then
    TAG="early-access"
    VERSION="999-SNAPSHOT"
fi

wget https://github.com/rodnansol/jbang-catalog-document-generator/releases/download/${TAG}/jbang-catalog-document-generator-cli-${VERSION}.jar -O jbang-catalog-document-generator-cli.jar