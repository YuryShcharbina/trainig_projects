#!/bin/bash

service docker start
setup-sshd

exec "$@"
