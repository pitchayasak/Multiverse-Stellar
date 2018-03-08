# Testnet

This is CLOUD DEPLOYMENT MANAGER template for create and running Stellar Core Validator 3 nodes. The configruation including installation local PostgreSQL database instance on each nodes.

Stellar-core and PostgreSQL are all running in the same GCE on differencr zone.

## Prerequisites
Aside from having an Google Cloud account, You must create empty project first.
* Create Cloud Storeage bucket
    * Archive History
    * Deployment scripts and startup scripts

## Cost
The template creates a number of resources but the majority of them do not attract charges. You will be billed for the following resources:
* A GCE instance for every nodes.
* Cloud Storage capacity
*
Disclaimer: While we attempt to provide useful and up to date information, you are responsible for your own GCP account and the resources that you are charged for. Always be vigilant about doubling checking to ensure that the resources used are what your expect. 

## Template
The template .yaml and .jinja in the template foldes, so will be edit your parameter before running.

## Set Parameters
Most of the default parameters can be left as is, however you must specify:

* An SSH Key Pair to be associated with the instance (choose from the dropdown).
* An IP address range that is allowed to SSH into the instance in CIDR format.
* (Optional) An IP address range that is allowed to access the Horizon API via HTTP. Leave blank to block external access.
