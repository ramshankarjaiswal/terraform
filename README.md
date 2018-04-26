# terraform
Terraform code to create a VM in AWS running RHEL 7.4 (Free tier eligible), Security group to open port 80 and 22 to the world. (Keeping port 22 open to the world is not recommended, better to change it to allow traffic only from your own ip address)

Clone the repo
Update your credentials (access/secret key) in ~/.aws/credentials
    [default]
    aws_access_key_id=yyzxhfajhwui
    aws_secret_access_key=sueyfihsdhkj


The above credentials are being specified in the terraform code via
    provider "aws" {
      profile = "${var.profile}"
    }

So if we place our credentials in the ~/aws/credentials file under the [default] block then the value of the profile variable should be default. If you're managing multiple aws accounts you can change the name from [default] to say [prod] and then update the value for profile variable to prod in the variables.tf file.


Generating credentials for aws - https://console.aws.amazon.com/iam/home?#security_credential


In variables.tf

Replace key_name with the actual key name which you already have on your aws account. If you do not have any existing key then please create a new key in https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#KeyPairs:

Replace key_path default value with the actual path of where your private key exists on your local system.


Run the following commands in the folder
    terraform init
    terraform plan
    terraform apply

I've added 2 additional rule in the security group to allow all tcp and udp traffic originating from the same subnet as your servers in the same subnet may need to communicate with others on other ports. These lines can be deleted if you do not want this.



Terraform Backend and State Locking on AWS
- Create an S3 Bucket
- Create a dynamodb table - From your browser > AWS Service DyanamoDB > Create Table >
- Table Name = testtb
- Primary Key = LockID
- Use Default Settings > Create
