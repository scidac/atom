#!/bin/bash
VALUE=$(cat)
if [[ "$VALUE" == *"Fast-forward"* ]]
then
    echo "$VALUE"
fi
