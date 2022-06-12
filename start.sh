#!/bin/bash

echo "Stopping fingerprint service..."
docker stop test

echo "Removing Fingerprint Serivce"
docker rm test

echo "Building Fingerprint Service Image..."
docker build --tag fingerprint_test_image .

echo "Starting service..."
docker run --name test fingerprint_test_image:latest
