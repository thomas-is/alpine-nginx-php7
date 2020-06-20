#!/bin/bash
docker build -t anp7 .
docker run -d --rm --name anp7_demo -p 8080:80 anp7
