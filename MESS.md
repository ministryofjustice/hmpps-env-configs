# hmpps-env-configs

Configuration files for environments.

## Mess

Because the TG_ENVIRONMENT_IDENTIFIER is insanely long we have situations where the AWS resource name is too long when use in a resource name.
Example Load Balencers (32 chars)
S3 Buckets (62 chars)

Instead of using TG_ENVIRONMENT_NAME previous var is used which caused predicatble issue. So instead of using the sensible var a series of overrides have been created.
Depending on the TF repo (Mis , SPG or Alfresco) a different override file may be used, resulting in various version of the value - so it's inconsistent between sub-projects and environemnts - insanity.

So in common we have
    TG_ENVIRONMENT_IDENTIFIER="tf-${TG_REGION}-${TG_BUSINESS_UNIT}-${TG_PROJECT_NAME}-${TG_ENVIRONMENT_TYPE}"
    TG_SHORT_ENVIRONMENT_IDENTIFIER="tf-${TG_BUSINESS_UNIT}-${TG_PROJECT_NAME_ABBREVIATED}-${TG_ENVIRONMENT_TYPE}"
    TG_ENVIRONMENT_NAME="${TG_PROJECT_NAME}-${TG_ENVIRONMENT_TYPE}"
    TG_SHORT_ENVIRONMENT_NAME="${TG_PROJECT_NAME_ABBREVIATED}-${TG_ENVIRONMENT_TYPE}"

Resulting in for Example
    TG_ENVIRONMENT_IDENTIFIER         tf-eu-west-2-hmpps-delius-po-test1
    TG_SHORT_ENVIRONMENT_IDENTIFIER   tf-hmpps-dpt1-po-test1
    TG_ENVIRONMENT_NAME               delius-po-test1
    TG_SHORT_ENVIRONMENT_NAME         dpt1-po-test1

Then if there is an override

    TG_SHORT_ENVIRONMENT_IDENTIFIER="tf-${TG_PROJECT_NAME_ABBREVIATED}-${TG_ENVIRONMENT_TYPE}"

    TG_SHORT_ENVIRONMENT_IDENTIFIER   dpt1-po-test1


Then there is Alfresco override in delius-training-test
    TG_ENVIRONMENT_IDENTIFIER="tf-${TG_PROJECT_NAME_ABBREVIATED}"
    TG_SHORT_ENVIRONMENT_IDENTIFIER="tf-${TG_PROJECT_NAME_ABBREVIATED}"
    TG_SHORT_ENVIRONMENT_NAME="${TG_ENVIRONMENT_IDENTIFIER}"

    TG_ENVIRONMENT_IDENTIFIER       tf-dpt1
    TG_SHORT_ENVIRONMENT_IDENTIFIER tf-dpt1
    TG_SHORT_ENVIRONMENT_NAME       tf-dpt1

So depending on sub-project and environment

    TG_ENVIRONMENT_IDENTIFIER
                        tf-eu-west-2-hmpps-delius-po-test1
                        -
                        tf-dpt1

    TG_SHORT_ENVIRONMENT_IDENTIFIER
                        tf-hmpps-dpt1-po-test1
                        dpt1-po-test1
                        tf-dpt1

    TG_SHORT_ENVIRONMENT_NAME
                        dpt1-po-test1
                        -
                        tf-dpt1

In Delius-Core sub project and most of Shared VPC the varible TG_ENVIRONMENT_NAME has been used as it is short and clean
While in other projects TG_ENVIRONMENT_IDENTIFIER has been used then one of the overriden values.

A useful TG_SHORT_ENVIRONMENT_IDENTIFIER   tf-hmpps-dpt1-po-test1 might look like

          TG_SHORT_ENVIRONMENT_IDENTIFIER   eu-west-2-dpt1

So as not to break things
          TG_TINY_ENVIRONMENT_IDENTIFIER="${TG_REGION}-${TG_SHORT_ENVIRONMENT_NAME}"

          TG_TINY_ENVIRONMENT_IDENTIFIER   eu-west-2-dpt1-po-test1

Has region so is useful for S3 buckets keeping bucket names unique across globe
