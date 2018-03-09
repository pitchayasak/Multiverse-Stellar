#!/bin/bash

. config.ini

rm -f template/*
rm -f scripts/*
rm -f deploy.sh

cp src/network.jinja.template template/network.jinja
cp src/network.yaml.template template/network.yaml
cp src/firewall.jinja.template template/firewall.jinja
cp src/gce-core-validator.jinja.template template/gce-core-validator.jinja
cp src/gce-core-validator.yaml.template template/gce-core-validator.yaml

cp src/deploy.sh.template deploy.sh
cp src/core-validator.cfg.template scripts/core-validator.cfg

sed -i 's/<!GCP_PROJECT_NAME>/'"$GCP_PROJECT_NAME"'/g' deploy.sh

sed -i 's/<!GCP_PROJECT_NAME>/'"$GCP_PROJECT_NAME"'/g' scripts/core-validator.cfg
sed -i 's/<!CORE_VALIDATOR_PUBKEY_1>/'"$CORE_VALIDATOR_PUBKEY_1"'/g' scripts/core-validator.cfg
sed -i 's/<!CORE_VALIDATOR_PUBKEY_2>/'"$CORE_VALIDATOR_PUBKEY_2"'/g' scripts/core-validator.cfg
sed -i 's/<!CORE_VALIDATOR_PUBKEY_3>/'"$CORE_VALIDATOR_PUBKEY_3"'/g' scripts/core-validator.cfg
sed -i 's/<!CORE_VAL_NAME_PREFIX>/'"$CORE_VAL_NAME_PREFIX"'/g' scripts/core-validator.cfg

sed -i 's/<!GCP_NETWORK_NAME>/'"$GCP_NETWORK_NAME"'/g' template/network.jinja
sed -i 's/<!GCP_NETWORK_NAME>/'"$GCP_NETWORK_NAME"'/g' template/firewall.jinja

sed -i 's/<!GCP_PROJECT_NAME>/'"$GCP_PROJECT_NAME"'/g' template/gce-core-validator.yaml
sed -i 's/<!GCE_SERVICE_ACCOUNT>/'"$GCE_SERVICE_ACCOUNT"'/g' template/gce-core-validator.yaml
sed -i 's/<!GCP_NETWORK_NAME>/'"$GCP_NETWORK_NAME"'/g' template/gce-core-validator.yaml

sed -i 's/<!CORE_VAL_NAME_PREFIX>/'"$CORE_VAL_NAME_PREFIX"'/g' template/gce-core-validator.yaml
sed -i 's/<!STELLAR_NETWORK_PASSPHRASE>/'"$STELLAR_NETWORK_PASSPHRASE"'/g' template/gce-core-validator.yaml
sed -i 's/<!CORE_VALIDATOR_KEY_1>/'"$CORE_VALIDATOR_KEY_1"'/g' template/gce-core-validator.yaml
sed -i 's/<!CORE_VALIDATOR_KEY_2>/'"$CORE_VALIDATOR_KEY_2"'/g' template/gce-core-validator.yaml
sed -i 's/<!CORE_VALIDATOR_KEY_3>/'"$CORE_VALIDATOR_KEY_3"'/g' template/gce-core-validator.yaml
sed -i 's/<!CORE_ZONE_1>/'"$CORE_ZONE_1"'/g' template/gce-core-validator.yaml
sed -i 's/<!CORE_ZONE_2>/'"$CORE_ZONE_2"'/g' template/gce-core-validator.yaml
sed -i 's/<!CORE_ZONE_3>/'"$CORE_ZONE_3"'/g' template/gce-core-validator.yaml

sed -i 's/<!PSQL_DBNAME>/'"$PSQL_DBNAME"'/g' template/gce-core-validator.yaml
sed -i 's/<!PSQL_USERNAME>/'"$PSQL_USERNAME"'/g' template/gce-core-validator.yaml
sed -i 's/<!PSQL_PASSWORD>/'"$PSQL_PASSWORD"'/g' template/gce-core-validator.yaml

sed -i 's/<!HISTORY_ARCHIVE>/'"$HISTORY_ARCHIVE"'/g' template/gce-core-validator.yaml
sed -i 's/<!DEPLOYMENT_SCRIPTS>/'"$DEPLOYMENT_SCRIPTS"'/g' template/gce-core-validator.yaml
sed -i 's/<!MACHINE_TYPE>/'"$MACHINE_TYPE"'/g' template/gce-core-validator.yaml

gsutil cp scripts/core-validator.cfg gs://$DEPLOYMENT_SCRIPTS

gsutil acl ch -u $GCE_SERVICE_ACCOUNT:W gs://$HISTORY_ARCHIVE
