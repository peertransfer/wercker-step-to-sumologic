#!/bin/bash

#check if sumologic collector url is present
if [ -z "$WERCKER_SUMOLOGIC_NOTIFIER_URL" ]; then
  fail "Please provide a Sumologic collector URL"
fi
