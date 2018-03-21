#!/bin/bash

. config.ini

gsutil rb -f gs://$GCP_NETWORK_NAME-history-archives

gsutil rb -f gs://$GCP_NETWORK_NAME-deployment

gcloud iam service-accounts delete history-archive@$GCP_NETWORK_NAME.iam.gserviceaccount.com --project $GCP_NETWORK_NAME

sleep 3s

gcloud deployment-manager deployments delete core-validator --project $GCP_NETWORK_NAME

sleep 3s

gcloud deployment-manager deployments delete myproject-network --project $GCP_NETWORK_NAME







# gcloud deployment-manager deployments create core-horizon --config template/gce-core-horizon.yaml --project oasis-p

# gcloud deployment-manager deployments create horizon-ha --config template/gce-horizon-ha.yaml --project oasis-p
