#!/bin/bash

. config.ini

gsutil rb -f gs://$GCP_PROJECT_NAME-history-archives

gsutil rb -f gs://$GCP_PROJECT_NAME-deployment

gcloud iam service-accounts delete history-archive@$GCP_PROJECT_NAME.iam.gserviceaccount.com --project $GCP_PROJECT_NAME -q

sleep 3s

gcloud deployment-manager deployments delete core-validator --project $GCP_PROJECT_NAME -q

sleep 3s

gcloud deployment-manager deployments delete $GCP_PROJECT_NAME-net --project $GCP_PROJECT_NAME -q







# gcloud deployment-manager deployments create core-horizon --config template/gce-core-horizon.yaml --project oasis-p

# gcloud deployment-manager deployments create horizon-ha --config template/gce-horizon-ha.yaml --project oasis-p
