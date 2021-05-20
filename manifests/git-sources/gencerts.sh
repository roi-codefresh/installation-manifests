#!/bin/sh
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
    tls.key -out tls.crt -subj "/CN=codefresh-events.io/O=codefresh-events.io"

kubectl create secret tls tls-secret --key tls.key --cert tls.crt --context $KUBE_CONTEXT -n $NAMESPACE
