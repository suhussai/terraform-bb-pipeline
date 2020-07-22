#!/bin/bash -ex

if [ -z "${AWS_ACCOUNT_ID}" ]; then
    echo "You must set the AWS_ACCOUNT_ID environment variable."
    exit 1;
fi

if [ -z "${AWS_ACCESS_KEY_ID}" ]; then
    echo "You must set the AWS_ACCESS_KEY_ID environment variable."
    exit 1;
fi

if [ -z "${AWS_SECRET_ACCESS_KEY}" ]; then
    echo "You must set the AWS_SECRET_ACCESS_KEY environment variable."
    exit 1;
fi

if [ -z "${ENVIRONMENT_NAME}" ]; then
    echo "WARNING: You have not set the ENVIRONMENT_NAME environment variable. Defaulting to dev."
    export ENVIRONMENT_NAME=dev
    exit 0;
fi
