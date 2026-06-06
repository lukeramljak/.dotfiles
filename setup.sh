#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  bash setup-mac.sh
else
  bash setup-linux.sh
fi
