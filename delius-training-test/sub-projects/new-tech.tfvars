# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

# Origial ported tfavrs from beanstalk env_config
delius_api_min_asg_size = 1
delius_api_max_asg_size = 4
delius_api_instance_type = "t2.micro"
delius_api_lower_cpu_trigger = 5
delius_api_upper_cpu_trigger = 10

pdf_generator_min_asg_size = 1
pdf_generator_max_asg_size = 4
pdf_generator_instance_type = "t2.micro"
pdf_generator_lower_cpu_trigger = 5
pdf_generator_upper_cpu_trigger = 10
pdf_generator_debug_log = "true"

# Override default casenotes Config
casenotes_conf = {

}

# Override default PDF Generator Config
pdfgenerator_conf = {}
