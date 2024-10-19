#!/bin/bash

test $(grep -c "Got \[" "$1") -eq 0
