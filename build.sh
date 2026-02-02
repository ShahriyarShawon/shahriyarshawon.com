#!/bin/bash

rm -rf docs/*
hugo --destination docs
touch docs/CNAME
echo "shahriyarshawon.com" > docs/CNAME
