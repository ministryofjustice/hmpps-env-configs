vpc_supernet = "10.161.4.0/22"

aws_nameserver = "10.161.4.2"

# Testing/Chaosmonkey 
ce_instances = ["m5.large", "c5.large"]
ce_min_vcpu = 0
ce_max_vcpu = 8
ce_queue_state = "ENABLED"
chaosmonkey_job_image = "mojdigitalstudio/hmpps-chaosmonkey:0.0.225-alpha"
chaosmonkey_job_vcpus = 1
chaosmonkey_job_memory = 128
chaosmonkey_job_retries = 1
chaosmonkey_job_envvars = [
    {
        "name" = "SIMIANARMY_CLIENT_LOCALDB_ENABLED"
        "value" =  "true"
    },
    {
        "name" = "SIMIANARMY_CALENDAR_TIMEZONE"
        "value" = "Europe/London"
    },
    {
        "name" = "SIMIANARMY_CHAOS_LEASHED"
        "value" = "false"
    },
    {
        "name" = "SIMIANARMY_CALENDAR_OPENHOUR"
        "value" = "9"
    },
    {
        "name" = "SIMIANARMY_CALENDAR_CLOSEHOUR"
        "value" = "18"
    },    
    {
        "name" = "SIMIANARMY_CLIENT_AWS_REGION"
        "value" = "eu-west-2"
    }, 
]
chaosmonkey_job_ulimits = []