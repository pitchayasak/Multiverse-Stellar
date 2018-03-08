#!/bin/bash

gcloud deployment-manager deployments create oasis-network --config template/network.yaml --project oasis-testnet

sleep 3s

gcloud deployment-manager deployments create core-validator --config template/gce-core-validator.yaml --project oasis-testnet


