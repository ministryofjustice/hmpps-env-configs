vpc_supernet = "10.162.32.0/20"

aws_nameserver = "10.162.32.2"


#lambda auto start stop vars
ec2_schedule                       = "true"
autoscaling_schedule               = "true"
calendar_rule_enabled              = "true"
autostop_notify_rule_enabled       = "true"
tagged_user                        = "<@UA84K4FG8>  <@UA8N2QDHR>  <@U9C74KBLP>  <@UAWCS3F0A>"
channel                            = "auto-stop-alerts"
create_autostop_instance           = "true"
mis_overide_autostop_tags          = "True"  ##Set autostop tag key value for MIS Servers
mis_overide_resizing_schedule_tags = "false" ##Set resizing schedule tag key value for MIS Servers

# oracle_backup_schedule should be specified using the Europe/London timezone (i.e DST is handled automatically)
oracle_backup_schedule = {
  delius = {
    daily_schedule  = "30 06 ? * 2,3,5,6 *"
    weekly_schedule = "30 06 ? * 4 *"
  },
  mis = {
    daily_schedule  = "30 06 ? * 2,3,5,6 *"
    weekly_schedule = "30 06 ? * 4 *"
  },
  misboe = {
    daily_schedule  = "30 06 ? * 2,3,5,6 *"
    weekly_schedule = "30 06 ? * 4 *"
  },
  misdsd = {
    daily_schedule  = "30 06 ? * 2,3,5,6 *"
    weekly_schedule = "30 06 ? * 4 *"
  }
}

database_high_availability_count = {
  delius = 2
  mis    = 0
  misboe = 0
  misdsd = 0
}

offloc_rotate_password_schedule = {
  schedule_expression = ""
}

oracle_delete_unused_dbids = "yes"

oracle_rotate_passwords_schedule = {
  schedule_expression = "00 12 ? * TUE *"
}

# Support for running different Ansible Versions for Oracle Playbooks
# Specify the tag for the Docker Ansible Runner image to use
# along with default tags for the Git branches with the appropriate
# versions of Ansible compatible with that image.
# (These will default to the "latest" image and "master" branch)
oracle_ansible_versions = {
  docker_image_tag                         = "0.0.0-20230712141248-alpha"
  delius_manual_deployments_default_branch = "master"
  hmpps_delius_pipelines_default_branch    = "master"
}

# Here we define the configuration for Audited Interaction data
# preservation by defining which database server is used as a 
# source for the data:  delius_primarydb, delius_standbydb1 or delius_standbydb2
# (If using a standby database then Active Data Guard must be enabled).
# Specify the target environment where the data is written.   It will 
# be written to the primary Delius database server in that environment.
# (Target Environment Names should match those listed in aws_account_ids)
oracle_audited_interaction = {
  source_server = "delius_standbydb2"
  target_environment = "hmpps-delius-test"
}

oracle_s3_backup_bucket_access = {
    modernisation_platform_role_arns = [
      "arn:aws:iam::326912278139:role/dev-delius-db-ec2_instance"
    ]
}
