#!/bin/bash

. config.ini

echo `date +"%Y-%m-%d"`" Begin remove installation scripts."
echo " "

gcloud compute instances remove-metadata core-validator-1 --keys=startup-script --project `echo $GCP_PROJECT_NAME`
gcloud compute instances remove-metadata core-validator-2 --keys=startup-script --project `echo $GCP_PROJECT_NAME`
gcloud compute instances remove-metadata core-validator-3 --keys=startup-script --project `echo $GCP_PROJECT_NAME`
gcloud compute instances remove-metadata core-horizon --keys=startup-script --project `echo $GCP_PROJECT_NAME`

echo " "
echo `date +"%Y-%m-%d"`" Begin update startup scripts."
gcloud compute instances add-metadata core-validator-1 \
    --metadata startup-script-url=gs://`echo $GCP_PROJECT_NAME`-deployment/start-validator.sh

gcloud compute instances add-metadata core-validator-2 \
    --metadata startup-script-url=gs://`echo $GCP_PROJECT_NAME`-deployment/start-validator.sh

gcloud compute instances add-metadata core-validator-3 \
    --metadata startup-script-url=gs://`echo $GCP_PROJECT_NAME`-deployment/start-validator.sh

gcloud compute instances add-metadata core-horizon \
    --metadata startup-script-url=gs://`echo $GCP_PROJECT_NAME`-deployment/start-core-horizon.sh

echo " "
echo `date +"%Y-%m-%d"`" Finish update startup scripts."
