#!/bin/bash

. config.ini

gcloud deployment-manager deployments create core-horizon --config template/gce-core-horizon.yaml --project $GCP_PROJECT_NAME
