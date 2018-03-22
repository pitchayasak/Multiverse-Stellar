#!/bin/bash

. config.ini

rm -f template/*
rm -f scripts/*
rm -f deploy.sh
rm -f patch.sh
rm -f undeploy.sh

cp src/network.jinja.template template/network.jinja
cp src/network.yaml.template template/network.yaml
cp src/firewall.jinja.template template/firewall.jinja
cp src/gce-core-validator.jinja.template template/gce-core-validator.jinja
cp src/gce-core-validator.yaml.template template/gce-core-validator.yaml
cp src/gce-core-horizon.jinja.template template/gce-core-horizon.jinja
cp src/gce-core-horizon.yaml.template template/gce-core-horizon.yaml
cp src/gce-horizon-ha.jinja.template template/gce-horizon-ha.jinja
cp src/gce-horizon-ha.yaml.template template/gce-horizon-ha.yaml

cp src/deploy.sh.template deploy.sh
cp src/patch.sh.template patch.sh
cp src/undeploy.sh.template undeploy.sh
cp src/start-validator.sh.template scripts/start-validator.sh
cp src/start-core-horizon.sh.template scripts/start-core-horizon.sh
cp src/core-validator.cfg.template scripts/core-validator.cfg
cp src/core-watcher.cfg.template scripts/core-watcher.cfg
cp src/stellar-horizon-ingest.cfg.template scripts/stellar-horizon-ingest.cfg
cp src/stellar-horizon-ha.cfg.template scripts/stellar-horizon-ha.cfg
#cp src/cloudsql.json scripts/cloudsql.json

sed -i 's/<!GCP_PROJECT_NAME>/'"$GCP_PROJECT_NAME"'/g' scripts/core-validator.cfg
sed -i 's/<!CORE_VALIDATOR_PUBKEY_1>/'"$CORE_VALIDATOR_PUBKEY_1"'/g' scripts/core-validator.cfg
sed -i 's/<!CORE_VALIDATOR_PUBKEY_2>/'"$CORE_VALIDATOR_PUBKEY_2"'/g' scripts/core-validator.cfg
sed -i 's/<!CORE_VALIDATOR_PUBKEY_3>/'"$CORE_VALIDATOR_PUBKEY_3"'/g' scripts/core-validator.cfg
sed -i 's/<!CORE_VAL_NAME_PREFIX>/'"$CORE_VAL_NAME_PREFIX"'/g' scripts/core-validator.cfg

sed -i 's/<!GCP_PROJECT_NAME>/'"$GCP_PROJECT_NAME"'/g' scripts/core-watcher.cfg
sed -i 's/<!CORE_VALIDATOR_PUBKEY_1>/'"$CORE_VALIDATOR_PUBKEY_1"'/g' scripts/core-watcher.cfg
sed -i 's/<!CORE_VALIDATOR_PUBKEY_2>/'"$CORE_VALIDATOR_PUBKEY_2"'/g' scripts/core-watcher.cfg
sed -i 's/<!CORE_VALIDATOR_PUBKEY_3>/'"$CORE_VALIDATOR_PUBKEY_3"'/g' scripts/core-watcher.cfg
sed -i 's/<!CORE_VAL_NAME_PREFIX>/'"$CORE_VAL_NAME_PREFIX"'/g' scripts/core-watcher.cfg

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

sed -i 's/<!GCP_PROJECT_NAME>/'"$GCP_PROJECT_NAME"'/g' template/gce-core-horizon.yaml
sed -i 's/<!CH_GCE_SERVICE_ACCOUNT>/'"$CH_GCE_SERVICE_ACCOUNT"'/g' template/gce-core-horizon.yaml
sed -i 's/<!GCP_NETWORK_NAME>/'"$GCP_NETWORK_NAME"'/g' template/gce-core-horizon.yaml

sed -i 's/<!CH_NAME_PREFIX>/'"$CH_NAME_PREFIX"'/g' template/gce-core-horizon.yaml
sed -i 's/<!STELLAR_NETWORK_PASSPHRASE>/'"$STELLAR_NETWORK_PASSPHRASE"'/g' template/gce-core-horizon.yaml

sed -i 's/<!CORE_HORIZON_ZONE_1>/'"$CORE_HORIZON_ZONE_1"'/g' template/gce-core-horizon.yaml

sed -i 's/<!CH_PSQL_CORE_DBNAME>/'"$CH_PSQL_CORE_DBNAME"'/g' template/gce-core-horizon.yaml
sed -i 's/<!CH_PSQL_HORIZON_DBNAME>/'"$CH_PSQL_HORIZON_DBNAME"'/g' template/gce-core-horizon.yaml
sed -i 's/<!CH_PSQL_USERNAME>/'"$CH_PSQL_USERNAME"'/g' template/gce-core-horizon.yaml
sed -i 's/<!CH_PSQL_PASSWORD>/'"$CH_PSQL_PASSWORD"'/g' template/gce-core-horizon.yaml

sed -i 's/<!CLOUD_SQL_INSTANCE>/'"$CLOUD_SQL_INSTANCE"'/g' template/gce-core-horizon.jinja

sed -i 's/<!HISTORY_ARCHIVE>/'"$HISTORY_ARCHIVE"'/g' template/gce-core-horizon.yaml
sed -i 's/<!DEPLOYMENT_SCRIPTS>/'"$DEPLOYMENT_SCRIPTS"'/g' template/gce-core-horizon.yaml
sed -i 's/<!CH_MACHINE_TYPE>/'"$CH_MACHINE_TYPE"'/g' template/gce-core-horizon.yaml

sed -i 's/<!GCP_PROJECT_NAME>/'"$GCP_PROJECT_NAME"'/g' template/gce-horizon-ha.yaml
sed -i 's/<!CH_GCE_SERVICE_ACCOUNT>/'"$CH_GCE_SERVICE_ACCOUNT"'/g' template/gce-horizon-ha.yaml
sed -i 's/<!GCP_NETWORK_NAME>/'"$GCP_NETWORK_NAME"'/g' template/gce-horizon-ha.yaml

sed -i 's/<!CHH_NAME_PREFIX>/'"$CHH_NAME_PREFIX"'/g' template/gce-horizon-ha.yaml
sed -i 's/<!STELLAR_NETWORK_PASSPHRASE>/'"$STELLAR_NETWORK_PASSPHRASE"'/g' template/gce-horizon-ha.yaml

sed -i 's/<!CORE_HORIZON_ZONE_1>/'"$CORE_HORIZON_ZONE_1"'/g' template/gce-horizon-ha.yaml

sed -i 's/<!CH_PSQL_CORE_DBNAME>/'"$CH_PSQL_CORE_DBNAME"'/g' template/gce-horizon-ha.yaml
sed -i 's/<!CH_PSQL_HORIZON_DBNAME>/'"$CH_PSQL_HORIZON_DBNAME"'/g' template/gce-horizon-ha.yaml
sed -i 's/<!CH_PSQL_USERNAME>/'"$CH_PSQL_USERNAME"'/g' template/gce-horizon-ha.yaml
sed -i 's/<!CH_PSQL_PASSWORD>/'"$CH_PSQL_PASSWORD"'/g' template/gce-horizon-ha.yaml

sed -i 's/<!CLOUD_SQL_INSTANCE>/'"$CLOUD_SQL_INSTANCE"'/g' template/gce-horizon-ha.jinja

sed -i 's/<!HISTORY_ARCHIVE>/'"$HISTORY_ARCHIVE"'/g' template/gce-horizon-ha.yaml
sed -i 's/<!DEPLOYMENT_SCRIPTS>/'"$DEPLOYMENT_SCRIPTS"'/g' template/gce-horizon-ha.yaml
sed -i 's/<!CH_MACHINE_TYPE>/'"$CH_MACHINE_TYPE"'/g' template/gce-horizon-ha.yaml


