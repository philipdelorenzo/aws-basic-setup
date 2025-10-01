# aws-basic-setup

A simple Terraform project that sets up a VPC with:


## Prerequisites

There are some prerequisites that will allow the developer to interact with this repo much easier, with
greater efficiency.

This just makes it simple - you can create whatever you like on your system.

- [asdf](https://asdf-vm.com/)
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Python 3.13+](https://www.python.org/)
- [Kubectl 1.34.1](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/)

## _TL;DR Developer Experience_

For a better developer experience, a Makefile _(for MacOS only)_ has been provided in the repo root, you can quickly install these with the following command:

```bash
make bootstrap
```

## IaC Documentation

In order to build the Helium application, there are some extra pieces that are needed - this are all available after running
`make init` but you will need to add an aws profile _(a profile in the AWS account you would like to use to install and run the infrastructure)_.

See the [IaC Documentation](./iac/README.md)

## Doppler Configuration

The following variables are needed in the sync'd configuration from Doppler.

Project Name: `<choose-a-project-name>`  
Configs: `dev`, `stg`, `prd`  
Variables:
```yaml
APP_NAME: <name-of-your-app>
AWS_ACCOUNT_ID: <aws-account-id>
AWS_PROFILE: <profile-with-correct-permissions>
AWS_REGION: <aws-region> # Kept secret to add another layer of complexity for potential bad actors
```
