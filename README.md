# hmpps-env-configs

Configuration files for environments.

### Purpose
This repo contains environment properties, Terraform TF_VARS and Ansible config files for an environment.

### Structure
The repo contains top level directories named as per the environment name.

Each configuration constructs any local identifiers from a short list of variables (region, project, environment type, vpc CIDR, account ID) passed in.
You should not leak derived values into the env_configs directory (see below)

Each environment has a pair of files - a <env_type>.properties file which sets up environment variables identifying the environment, and a <dev_name>.tfvars file which contains environment-specific variables.

Initially the Structure will be as follows and a new dir per env:

```
├── common
├── delius-preprod
├── delius-prod
├── delius-stage
└── delius-test
```
Example below
```
├── common
│   ├── common.properties
│   └── common.tfvars
├── delius-stage
│   ├── delius-stage.properties
│   └── delius-stage.tfvars
└── delius-test
    ├── delius-test.properties
    └── delius-test.tfvars

```

While the repetition of the env name inside the directory looks redundant it is to ensure the file is easily identifiable when multiple files are open within an engineer's text editor.

## GitHub Actions

An action to delete the branch after merge has been added.
Also an action that will tag when branch is merged to master
See https://github.com/anothrNick/github-tag-action

```
Bumping

Manual Bumping: Any commit message that includes #major, #minor, or #patch will trigger the respective version bump. If two or more are present, the highest-ranking one will take precedence.

Automatic Bumping: If no #major, #minor or #patch tag is contained in the commit messages, it will bump whichever DEFAULT_BUMP is set to (which is minor by default).

Note: This action will not bump the tag if the HEAD commit has already been tagged.
```

## Additional info

### MOJ CIDR Ranges

https://github.com/ministryofjustice/moj-ip-addresses/blob/main/moj-cidr-addresses.yml
