#!/bin/bash
set -ev

export SONATYPE_USERNAME=$OSSRH_USERNAME
export SONATYPE_PASSWORD=$OSSRH_PASSWORD
export PGP_PASSPHRASE=$GPG_PASSPHRASE

# Import gpg key
echo $GPG_PRIVATE_KEY > private.key
gpg --fast-import private.key

# Deploy to Maven Central
sbt sonatypeDropAll
sbt publishSigned
sbt sonatypeRelease
