vpc_supernet = "10.162.0.0/20"

aws_nameserver = "10.162.0.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z8EM67XHVHKUL"


#lambda auto start stop vars
ec2_schedule                 = "true"
autoscaling_schedule         = "true"
rds_schedule                 = "true"
calendar_rule_enabled        = "true"
autostop_notify_rule_enabled = "true"
tagged_user                  = "<@U5XAZK38U>  <@UB9EZ30PK>  <@UJLLH2BS6>"
channel                      = "po_test_delius_test_alerts"
create_autostop_instance     = "true"

# oracle_backup_schedule should be specified using the Europe/London timezone (i.e DST is handled automatically)
oracle_backup_schedule = {
  delius = {
    daily_schedule  = "30 20 ? * 2,3,5,6 *"
    weekly_schedule = "30 20 ? * 4 *"
  }
}

oracle_validate_backup_schedule = {
  delius = {
    host     =  "delius_primarydb"
    schedule =  "00 16 ? * 3 *"
  }
}

database_high_availability_count = {
  delius = 0
  mis    = 0
  misboe = 0
  misdsd = 0
}

oracle_delete_unused_dbids = "yes"

oracle_rotate_passwords_schedule = {
    schedule_expression   =  "00 14 ? * TUE *"
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


oracle_s3_backup_bucket_access = {
    modernisation_platform_role_arns = [
      "arn:aws:iam::673591086753:role/instance-role-test-delius-db-1"
    ]
}