vpc_supernet = "10.160.32.0/20"

aws_nameserver = "10.160.32.2"

public_ssl_arn = ""

## lambda auto start stop vars
## Autostop will only be enabled for MIS Windows servers and MIS Oracle Databases
ec2_schedule                 = "true"
autoscaling_schedule         = "true"
rds_schedule                 = "false"
calendar_rule_enabled        = "true"
autostop_notify_rule_enabled = "true"
tagged_user                  = "<@UA84K4FG8>  <@UA8N2QDHR>  <@U9C74KBLP>  <@UAWCS3F0A> <@U8F91EGG3> <@UNY29P4P9>"
channel                      = "auto-stop-alerts"
create_autostop_instance     = "true"

## Due to requirement to enable autostop for a subset of MIS resources below vars have been added to target the correct resources only
## As the autostop key value is defined on env level, the below are to override the tag accordingly
## This only applies to environments where MIS is present
delius_overide_autostop_tags         = "False"    ##Override Phase1 autostop tag key value for Oracle Primary Servers
mis_overide_autostop_tags            = "True"     ##Set autostop tag key value for MIS Servers

## ## example output from the delius-network-terraform build
## strategic_public_zone_id = [
##     EXAMPLE67XHV
## ]

route53_strategic_hosted_zone_id = "Z3GRI9GET5CFF7"


## Delius Core Specific

instance_type_db = "t2.large"

#Instance size for smtp server
smtp_instance_type = "m5.large"

# oracle_backup_schedule should be specified using the Europe/London timezone (i.e DST is handled automatically)
oracle_backup_schedule = {
  delius = {
    daily_schedule  = "00 03 ? * 2-7 *"
    weekly_schedule = "00 02 ? * 1 *"
  },
  mis = {
    daily_schedule  = "00 03 ? * 2-7 *"
    weekly_schedule = "00 02 ? * 1 *"
  },
  misboe = {
    daily_schedule  = "00 03 ? * 2-7 *"
    weekly_schedule = "00 02 ? * 1 *"
  },
  misdsd = {
    daily_schedule  = "00 03 ? * 2-7 *"
    weekly_schedule = "00 02 ? * 1 *"
  }
}

oracle_delete_unused_dbids = "yes"

database_high_availability_count = {
  delius = 0
  mis    = 0
  misboe = 0
  misdsd = 0
}

oracle_rotate_passwords_schedule = {
    schedule_expression   =  "00 16 ? * WED *"
}

offloc_rotate_password_schedule = {
  schedule_expression = ""
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