#!/bin/bash

. config.ini

gsutil -m rm -rfa gs://$HISTORY_ARCHIVE

gsutil -m rm -rfa gs://$DEPLOYMENT_SCRIPTS

gcloud iam service-accounts delete history-archive@$GCP_PROJECT_NAME.iam.gserviceaccount.com --project $GCP_PROJECT_NAME -q

sleep 3s

gcloud deployment-manager deployments delete core-horizon --project $GCP_PROJECT_NAME -q

sleep 3s

gcloud deployment-manager deployments delete core-validator --project $GCP_PROJECT_NAME -q

sleep 3s

gcloud deployment-manager deployments delete $GCP_PROJECT_NAME-net --project $GCP_PROJECT_NAME -q





# gcloud deployment-manager deployments create horizon-ha --config template/gce-horizon-ha.yaml --project $GCP_PROJECT_NAME
