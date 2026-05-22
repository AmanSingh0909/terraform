# drift detection

# solution 1 - terraform refresh which will be in cron job means refresh will be done at regular intervals and if there is any drift it will be detected and we can take action accordingly

# solution 2/a - strict iam roles and policies to restrict users from making changes to the infrastructure without using terraform
# solution 2/b - setups some audit logs and monitoring to track any manual changes made to the infrastructure and alert the team 
# if there are any unauthorized changes iam roles and policies can be used to restrict users from making changes to the infrastructure without using terraform. 
# This can be done by creating specific roles and policies that only allow users to make changes through terraform and not directly through the AWS console or CLI. 
# This way, any changes made outside of terraform will be blocked and will not cause any drift in the infrastructure.