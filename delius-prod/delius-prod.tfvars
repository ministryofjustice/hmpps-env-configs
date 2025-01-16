vpc_supernet = "10.160.16.0/20"

aws_nameserver = "10.160.16.2"

public_ssl_arn = ""

## Delius Core Specific

instance_type_db = "t2.large"

route53_domain_private = "service.justice.gov.uk"

subdomain = "probation"

mis_overide_resizing_schedule_tags   = "false"     ##Set resizing schedule tag key value for MIS Servers


#Instance size for smtp server
smtp_instance_type = "m5.large"

# oracle_backup_schedule should be specified using the Europe/London timezone (i.e DST is handled automatically)
oracle_backup_schedule = {
  delius = {
    daily_schedule  = "00 03 ? * 2-7 *"
    weekly_schedule = "00 03 ? * 1 *"
  },
  mis = {
    daily_schedule  = "00 00 ? * 2-7 *"
    weekly_schedule = "00 00 ? * 1 *"
  },
  misboe = {
    daily_schedule  = "00 03 ? * 2-7 *"
    weekly_schedule = "00 03 ? * 1 *"
  },
  misdsd = {
    daily_schedule  = "00 03 ? * 2-7 *"
    weekly_schedule = "00 03 ? * 1 *"
  }
}

oracle_validate_backup_schedule = {
  delius = {
    host     = "Random Delius Standby"
    schedule = "00 13 ? * 4 *"
  },
  mis = {
    host     = "mis_standbydb1"
    schedule = "00 13 ? * 4 *"
  },
  misboe = {
    host     = "misboe_standbydb1"
    schedule = "00 13 ? * 4 *"
  }
  misdsd = {
    host     = "misdsd_standbydb1"
    schedule = "00 13 ? * 4 *"
  }
}

oracle_delete_unused_dbids = "no"

oracle_rotate_passwords_schedule = {
    schedule_expression   =  "00 14 ? * WED *"
}

database_high_availability_count = {
  delius = 2
  mis    = 1
  misboe = 1
  misdsd = 1
}

offloc_rotate_password_schedule = {
  schedule_expression = "0 11 ? * TUE#3 *"
}

# Support for running different Ansible Versions for Oracle Playbooks
# Specify the tag for the Docker Ansible Runner image to use
# along with default tags for the Git branches with the appropriate
# versions of Ansible compatible with that image.
# (These will default to the "latest" image and "master" branch)
oracle_ansible_versions = {
   docker_image_tag = "0.0.0-20230712141248-alpha"
   delius_manual_deployments_default_branch = "master"
   hmpps_delius_pipelines_default_branch = "master"
}

# Temporary override for del-prod-weblogic-app-task-definition memory increase
default_delius_app_config = {
  image_url = "895523100917.dkr.ecr.eu-west-2.amazonaws.com/hmpps/delius-weblogic:latest" # Version is managed by Ansible

  min_capacity                          = 25
  max_capacity                          = 40
  memory                                = 24576 # 24GB
  env_USER_MEM_ARGS                     = "-XX:MaxRAMPercentage=90.0"
  env_LOG_LEVEL_NDELIUS                 = "INFO"
}

# Self Signed Certs
self_signed_ca_algorithm = "RSA"
self_signed_ca_rsa_bits = "2048"
self_signed_ca_validity_period_hours = 8544
self_signed_ca_early_renewal_hours = 672
self_signed_server_algorithm = "RSA"
self_signed_server_rsa_bits = "2048"
self_signed_server_validity_period_hours = 2160
self_signed_server_early_renewal_hours = 336