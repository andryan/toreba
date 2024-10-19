#!/bin/bash

test $(grep -c "error404" "$1") -gt 0
