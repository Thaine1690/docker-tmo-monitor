#!/bin/sh -e

crontab /crontab
crond -f
