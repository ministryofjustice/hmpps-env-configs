#=====================================================
# ASG
#=====================================================
cporacle_asg_props = {
ami_id                = "ami-0b73a8cf2d56ca8a9" #"ami-07c04e88f232dc18a"
ami_image_tag_version = "0.74.0"
instance_type         = "t3.large"
ebs_volume_size       = 60
}

#=====================================================
# RDS
#=====================================================
rds_engine = "sqlserver-se"
# https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.VersionSupport
rds_engine_version       = "15.00.4073.23.v1" 
rds_family               = "sqlserver-se-15.0" # SQL Server Standard Edition
rds_major_engine_version = "15.00"
rds_instance_class       = "db.t3.xlarge"

rds_storage_type          = "gp2"
rds_allocated_storage     = "500"
rds_max_allocated_storage = "1000"
rds_storage_encrypted     = true

# https://docs.aws.amazon.com/cli/latest/reference/rds/create-db-instance.html
# rds_name                   = "Must be null for SQL Server so we don't use it"
rds_username               = "admin"
rds_create_random_password = false
rds_random_password_length = 30
rds_port                   = 1433

# rds_domain               = aws_directory_service_directory.demo.id
# rds_domain_iam_role_name = aws_iam_role.rds_ad_auth.name

rds_multi_az               = false

rds_maintenance_window          = "Mon:00:00-Mon:03:00"
rds_backup_window               = "03:00-06:00"
rds_delete_automatic_backups    = false
rds_enabled_cloudwatch_logs_exports = ["error", "agent"]

rds_backup_retention_period = 15
rds_skip_final_snapshot     = true
rds_copy_tags_to_snapshot   = true
rds_deletion_protection     = false

rds_performance_insights_enabled          = true
rds_performance_insights_retention_period = 7

rds_create_monitoring_role = true
rds_monitoring_interval    = 5

rds_options                   = [ ]

rds_create_db_parameter_group = false
rds_parameters                = []
rds_license_model             = "license-included"
rds_timezone                  = "GMT Standard Time"
rds_character_set_name        = "Latin1_General_CI_AS"

rds_iam_database_authentication_enabled = false
rds_replicate_source_db = ""
rds_snapshot_identifier = ""
rds_iops = 0
rds_publicly_accessible = false
rds_allow_major_version_upgrade = false
rds_allow_auto_minor_version_upgrade = true
rds_apply_immediately = true
