# GCP test repository

## Installation

*nix systems only

`ansible-playbook`, `packer` required to be in PATH

`project_id` need to be changed in `packer/image.json` `terraform/provider.tf`

Put .json file with credentials to `/etc/creds/admin.json`

`git clone <repo_url>`

`cd gce-test`

`./start`